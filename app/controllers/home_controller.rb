class HomeController < ApplicationController
  def index
  end

  def make_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = '1eflVHwPlh9xu29TdPbSPZqDS'      # "YOUR_CONSUMER_KEY"
      config.consumer_secret     = 'tjr5yp6gC7OedapbAnEkPNfxjsS4tgSE73A80geF7Yd3hjelvt'   # "YOUR_CONSUMER_SECRET"
      config.access_token        = '52472525-IlyxsbWLVipwsrwj27gJm0hT16e1stK78GcEMwDDg'
      config.access_token_secret = '01Dw71h1lWpu05CGrbej9xo4XRZiek9D44DyOytsO8e5T'
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
