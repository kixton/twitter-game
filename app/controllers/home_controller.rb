class HomeController < ApplicationController
  def index
  end

  def make_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key      # "YOUR_CONSUMER_KEY"
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret   # "YOUR_CONSUMER_SECRET"
    end
  end

  def tweets
    @twitter_client = self.make_twitter_client
    @tweets = @twitter_client.get("https://api.twitter.com/1.1/statuses/user_timeline.json?count=20&user_id=#{current_user.twitter_uid}")
    render json: @tweets
  end

  def friends
    @twitter_client = self.make_twitter_client
    @friends = @twitter_client.get("https://api.twitter.com/1.1/friends/list.json?user_id=#{current_user.twitter_uid}")
    render json: @friends
  end

end
