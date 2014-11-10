class HomeController < ApplicationController
  def index
  end

  def make_twitter_client
    Twitter::REST::Client.new do |config|
      print "PIPE! PIPE! PIPE! PIPE! PIPE! PIPE! PIPE! PIPE! "
      print config
      config.consumer_key        = Rails.application.secrets.twitter_api_key      # "YOUR_CONSUMER_KEY"
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret   # "YOUR_CONSUMER_SECRET"
      # config.access_token        = Rails.application.secrets.twitter_access_token  # "YOUR_ACCESS_TOKEN"
      # config.access_token_secret = Rails.application.secrets.twitter_access_token_secret # "YOUR_ACCESS_SECRET"
    end
  end

  def tweets
    @twitter_client = self.make_twitter_client
    # binding.pry
    # @tweets = @twitter_client.get("https://api.twitter.com/1.1/statuses/user_timeline.json?count=20&user_id=#{current_user.twitter_uid}")
    # @followers = @twitter_client.followers("#{current_user.twitter_uid}")
    @friends = @twitter_client.get("https://api.twitter.com/1.1/friends/list.json?count=4&user_id=#{current_user.twitter_uid}")
    # @ids = @friends[:ids]
    @test_hash = {}
    @friends[:users].each do |friend|
      @test_hash[friend[:screen_name]] = friend[:status][:text]
    end 
    # render json: @tweets
    # @usernames = []
    # @ids.each do |id|
      # @usernames << (@twitter_client.get("https://api.twitter.com/1.1/users/show.json?user_id=#{id}"))[:screen_name]
    # end
    # render json: @friends
    # render json: @usernames
    render json: @test_hash
  end
end
