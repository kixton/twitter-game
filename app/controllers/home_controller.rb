class HomeController < ApplicationController
  def index
  end

  def make_twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_API_SECRET"]
      config.access_token        = current_user.oauth_token
      config.access_token_secret = current_user.oauth_token_secret
    end
  end

  def tweets
    @twitter_client = self.make_twitter_client
    friends = @twitter_client.get(ENV["TWITTER_API_URL"] + "friends/list.json?count=20&user_id=#{current_user.twitter_uid}")
    tweet_bank = []
    embed_bank = []
    friends[:users].each do |friend|
      if friend[:status] != nil
        tweet_bank.push(
          {
            :name => friend[:screen_name],
            :last_tweet => friend[:status][:text],
            :last_tweet_id => friend[:status][:id_str],
            :created_at => friend[:status][:created_at],
            :retweet_count => friend[:status][:retweet_count],
            :favorite_count => friend[:status][:favorite_count]
          }
        )
      end
    end
    tweet_bank.each do |tweet|
      tweet[:last_tweet].gsub!('&amp;', '&') if tweet[:last_tweet].include?('&amp;')
    end
    user_tweets = tweet_bank.shuffle
    user_tweets.each do |tweet|
      embed_bank.push(tweet[:last_tweet_id])
    end
    embeddable_array = embed(embed_bank)
    user_tweets.each_with_index do |value, index|
      user_tweets[index][:embeddable_tweet] = embeddable_array[index][:html]
    end
    render json: user_tweets
  end

  def embed(ids_array)
    embeddable = [] 
    ids_array.each do |id|
      embeddable.push(@twitter_client.get(ENV["TWITTER_API_URL"] + "statuses/oembed.json?align=left&id="+id))
    end
    return embeddable
  end

  def tweeted
    twitter_client = self.make_twitter_client
    twitter_client.update("I'm playing Tweeter Quiz! https://tweeterquiz.herokuapp.com/")
    render json: {}
  end

end
