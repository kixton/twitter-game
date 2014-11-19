class HomeController < ApplicationController
  def index
  end

  def make_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]      # "YOUR_CONSUMER_KEY"
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]   # "YOUR_CONSUMER_SECRET"
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

  def tweets
    @twitter_client = self.make_twitter_client
    @friends = @twitter_client.get("https://api.twitter.com/1.1/friends/list.json?count=20&user_id=#{current_user.twitter_uid}")
    @tweet_bank = []
    @embed_bank = []
    @friends[:users].each do |friend|
      @tweet_bank << {:name => friend[:screen_name], :last_tweet => friend[:status][:text], :last_tweet_id => friend[:status][:id_str]}
    end 
    @user_tweets = @tweet_bank.shuffle
    @user_tweets.each do |tweet|
      @embed_bank << tweet[:last_tweet_id]
    end
    @embeddable_array = embed(@embed_bank)
    @user_tweets.each_with_index do |value, index|
      @user_tweets[index][:embeddable_tweet] = @embeddable_array[index][:html]
    end
    render json: @user_tweets
  end

  def embed(ids_array)
    @twitter_client = self.make_twitter_client
    @embeddable = [] 
    ids_array.each do |id|
      @embeddable << @twitter_client.get('https://api.twitter.com/1.1/statuses/oembed.json?align=left&id='+id)
    end
    return @embeddable
  end

end
