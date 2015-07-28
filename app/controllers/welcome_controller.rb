class WelcomeController < ApplicationController
  layout 'splash'

  def index
    if user_signed_in?
      redirect_to goals_path
    end
  end

  def search
   @client = Yelp::Client.new({ consumer_key: ENV['consumer_key'],
                        consumer_secret: ENV['consumer_secret'],
                        token: ENV['token'],
                        token_secret: ENV['token_secret']
                      })

    parameters = { term: params[:term], limit: 10 }
    @search_results = JSON.parse(@client.search('Salt Lake City', parameters).to_json)
  end
end
