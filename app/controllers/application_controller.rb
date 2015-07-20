class ApplicationController < ActionController::Base
  layout :layout_by_resource

  def forem_user
    current_user
  end
  helper_method :forem_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
    devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :current_password, :password, :password_confirmation, :last_name, :username, :first_name, :image)}
    devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :last_name, :username, :first_name, :image)}
  end


  protected

  def layout_by_resource
    if devise_controller? || params[:controller] == "welcome"
      "splash"
    elsif  params[:controller] == "forem"
      Forem.layout
    else
      "application"
    end
  end

end
