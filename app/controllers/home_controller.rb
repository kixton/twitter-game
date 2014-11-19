class HomeController < ApplicationController
  def index
  end

  def get_info
    @consumer_key = Rails.application.secrets.twitter_api_key
    @consumer_secret = Rails.application.secrets.twitter_api_secret
    @access_token = Rails.application.secrets.twitter_access_token
    @access_secret = Rails.application.secrets.twitter_access_token_secret
  end

  def make_twitter_client(ck, cs, at, as)
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ck      # "YOUR_CONSUMER_KEY"
      config.consumer_secret     = cs   # "YOUR_CONSUMER_SECRET"
      config.access_token        = at
      config.access_token_secret = as
    end
  end

  def tweets
    get_info
    @twitter_client = self.make_twitter_client(@consumer_key, @consumer_secret, @access_token, @access_secret)
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
    @twitter_client = self.make_twitter_client(@consumer_key, @consumer_secret, @access_token, @access_secret)
    @embeddable = [] 
    ids_array.each do |id|
      @embeddable << @twitter_client.get('https://api.twitter.com/1.1/statuses/oembed.json?align=left&id='+id)
    end
    return @embeddable
  end

end
