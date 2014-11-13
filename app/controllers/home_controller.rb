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
#     @user_tweets = [
# {
# name: "abt_programming",
# last_tweet: "'Generally, the craft of programming is the factoring of a set of requirements into a a set of functions and data structures' - D. Crockford",
# last_tweet_id: "532626434767196161",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p>&quot;Generally, the craft of programming is the factoring of a set of requirements into a a set of functions and data structures&quot; - D. Crockford</p>&mdash; About Programming (@abt_programming) <a href='https://twitter.com/abt_programming/status/532626434767196161'>'November 12, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# },
# {
# name: "bbdoolittle",
# last_tweet: "RT @TeddyGreenstein: Man am I dying to read a college basketball feature story that does not include usage rate.",
# last_tweet_id: "532204613500293121",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p>Man am I dying to read a college basketball feature story that does not include usage rate.</p>&mdash; Teddy Greenstein (@TeddyGreenstein) <a href='https://twitter.com/TeddyGreenstein/status/531947667656806400'>'November 10, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# },
# {
# name: "JonRogozen",
# last_tweet: "RT @neiltyson: Mysteries of #Interstellar: In this unreal future, they teach unscientific things in science class. Oh, wait. That is real.",
# last_tweet_id: "532282327872069632",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p>Mysteries of <a href='https://twitter.com/hashtag/Interstellar?src=hash'>'#Interstellar</a>: In this unreal future, they teach unscientific things in science class. Oh, wait. That is real.</p>&mdash; Neil deGrasse Tyson (@neiltyson) <a href='https://twitter.com/neiltyson/status/532244383098085377'>'November 11, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# },
# {
# name: "sonofaplum",
# last_tweet: "RT @JonRogozen: Where's everyone at? They're missing #partybart http://t.co/vCwOyvGS3u",
# last_tweet_id: "532202419078193153",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p>Where&#39;s everyone at? They&#39;re missing <a href='https://twitter.com/hashtag/partybart?src=hash'>'#partybart</a> <a href='http://t.co/vCwOyvGS3u'>'pic.twitter.com/vCwOyvGS3u</a></p>&mdash; Jon Rogozen (@JonRogozen) <a href='https://twitter.com/JonRogozen/status/532147154270175232'>'November 11, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# },
# {
# name: "PFF",
# last_tweet: "RT @PFF_NateJahnke: Our @PFF_Sam 's Analysis Notebook on Clay Matthews and his play against the Bears from Sunday Night https://t.co/On2Wyi…",
# last_tweet_id: "532664265216626688",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p>Our <a href='https://twitter.com/PFF_Sam'>'@PFF_Sam</a> &#39;s Analysis Notebook on Clay Matthews and his play against the Bears from Sunday Night <a href='https://t.co/On2Wyi00TJ'>'https://t.co/On2Wyi00TJ</a></p>&mdash; Nathan Jahnke (@PFF_NateJahnke) <a href='https://twitter.com/PFF_NateJahnke/status/532663927235018752'>'November 12, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# },
# {
# name: "Mooose_8",
# last_tweet: "Thank you to all who have served, who are serving, and will serve in the future. #thankful http://t.co/GD2SJK1IEW",
# last_tweet_id: "532363628276498432",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p>Thank you to all who have served, who are serving, and will serve in the future. <a href='https://twitter.com/hashtag/thankful?src=hash'>'#thankful</a> <a href='http://t.co/GD2SJK1IEW'>'pic.twitter.com/GD2SJK1IEW</a></p>&mdash; Mike Moustakas (@Mooose_8) <a href='https://twitter.com/Mooose_8/status/532363628276498432'>'November 12, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# },
# {
# name: "NateDuncanNBA",
# last_tweet: "@howardlio yeah but it was the entire possession I really enjoyed leading up to that.",
# last_tweet_id: "532671935348355072",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p><a href='https://twitter.com/howardlio'>'@howardlio</a> yeah but it was the entire possession I really enjoyed leading up to that.</p>&mdash; Nate Duncan (@NateDuncanNBA) <a href='https://twitter.com/NateDuncanNBA/status/532671935348355072'>'November 12, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# },
# {
# name: "KatzInTheHats",
# last_tweet: "@MakerSquare Rails Rumble victory lap! http://t.co/faXEzGGyXX",
# last_tweet_id: "523995026272288768",
# embeddable_tweet: "<blockquote class='twitter-tweet' align='left' width='350'><p><a href='https://twitter.com/MakerSquare'>'@MakerSquare</a> Rails Rumble victory lap! <a href='http://t.co/faXEzGGyXX'>'pic.twitter.com/faXEzGGyXX</a></p>&mdash; Jonathan Katz (@KatzInTheHats) <a href='https://twitter.com/KatzInTheHats/status/523995026272288768'>'October 20, 2014</a></blockquote> <script async src='//platform.twitter.com/widgets.js' charset='utf-8'>'</script>"
# }
# ]
    render json: @user_tweets
    # render json: @friends
  end

  def embed(ids)
    @twitter_client = self.make_twitter_client
    @embeddable = [] 
    ids.each do |id|
      @embeddable << @twitter_client.get('https://api.twitter.com/1.1/statuses/oembed.json?align=left&id='+id)
    end
    return @embeddable
  end

end
