class HomeController < ApplicationController
  def index
  end

  def make_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key      # "YOUR_CONSUMER_KEY"
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret   # "YOUR_CONSUMER_SECRET"
      config.access_token        = Rails.application.secrets.twitter_access_token  # "YOUR_ACCESS_TOKEN"
      config.access_token_secret = Rails.application.secrets.twitter_access_token_secret # "YOUR_ACCESS_SECRET"
    end
  end

  def tweets
    @twitter_client = self.make_twitter_client
    # binding.pry
    @tweets = @twitter_client.get("https://api.twitter.com/1.1/statuses/user_timeline.json?count=20&user_id=#{current_user.twitter_uid}")
    # @followers = @twitter_client.followers("#{current_user.twitter_uid}")
  end
end
