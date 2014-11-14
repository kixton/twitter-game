Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
  provider :twitter, Rails.application.secrets.twitter_api_key, Rails.application.secrets.twitter_api_secret
end