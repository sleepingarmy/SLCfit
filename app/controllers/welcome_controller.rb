class WelcomeController < ApplicationController
  # layout 'splash'

  def index
    if user_signed_in?
      redirect_to goals_path
    end
  end


  def search
    parameters = { term: params[:term], limit: 12 }
    @search = client.search(params[:location], parameters)
    # @search_results = JSON.parse(client.search(params[:location], parameters).to_json)
    binding.pry
  end

private

  def client
    @client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'],
                        consumer_secret: ENV['CONSUMER_KEY'],
                        token: ENV['TOKEN'],
                        token_secret: ENV['TOKEN_SECRET']
                      })
    
  end
end
