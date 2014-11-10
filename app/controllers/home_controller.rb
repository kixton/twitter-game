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
    @friends = @twitter_client.get("https://api.twitter.com/1.1/friends/list.json?count=4&user_id=#{current_user.twitter_uid}")
    @user_tweets = {}
    @friends[:users].each do |friend|
      @user_tweets[friend[:screen_name]] = friend[:status][:text]
    end 
    render json: @user_tweets
  end
end
