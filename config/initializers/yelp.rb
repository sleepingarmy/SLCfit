require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = 'J6MaSweSbpmvVHW10R1vdA'
  config.consumer_secret = 'jGSRMUnuQJ6Ji-KPz2s1xTKFIvM'
  config.token = '2ERgnKXxN-cNl6uJmfqdUiAbKKYPjKNG'
  config.token_secret = '6kJObB1JVx7XzJwKygKdGgfHX7g'
end

Yelp.client.search('Salt Lake City', { term: 'gyms' })