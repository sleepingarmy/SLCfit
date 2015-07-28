class WelcomeController < ApplicationController
  # layout 'splash'

  def index
    if user_signed_in?
      redirect_to goals_path
    end
  end

  def search
   @client = Yelp::Client.new({ consumer_key: ENV['CONSUMER_KEY'],
                        consumer_secret: ENV['CONSUMER_KEY'],
                        token: ENV['TOKEN'],
                        token_secret: ENV['TOKEN_SECRET']
                      })

    parameters = { term: params[:term], limit: 12 }
    @search_results = JSON.parse(@client.search('Salt Lake City', parameters).to_json)
  end
end
