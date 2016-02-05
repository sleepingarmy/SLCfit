Rails.application.routes.draw do
  get 'goals/resources'

  get 'welcome/index'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/about' => 'welcome#about'

  get '/contact' => 'welcome#contact'

  resources :goals do
    resources :weeks do
      resources :activities
    end
  end

  resources :biometrics
  resources :infos

  put '/update_activity' => 'activities#update'
  get '/activity_tr' => 'activities#activity_tr'
  get '/calendar' => 'activities#display'
  get '/plan_of_action/:goal_id'  => 'weeks#plan_of_action', as: :plan_of_action
  post '/create_plan/:goal_id/' => 'weeks#create_plan', as: :create_plan
  get '/bank' => 'activities#bank'

  get '/search_results' => 'welcome#search', as: :search_results
  get '/progress' => 'activities#progress'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
