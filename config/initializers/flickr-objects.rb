Flickr.configure do |config|
  config.api_key       = ENV["FLICKR_KEY"]
  config.shared_secret = ENV["FLICKR_SECRET"]
end
