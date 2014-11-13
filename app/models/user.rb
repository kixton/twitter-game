class User < ActiveRecord::Base
  has_many :scores
  
  def self.get_omniauth_user(params={})
    omniauth_params = params[:omniauth_params]
    if omniauth_params.nil? || omniauth_params["info"].nil? 
      return nil
    end

    user = User.find_by(twitter_uid: omniauth_params["uid"])
    if user
      return user
    end

    User.create(
      first_name: omniauth_params["info"]["name"].split(" ").first,
      last_name: omniauth_params["info"]["name"].split(" ").last,
      full_name: omniauth_params["info"]["name"],
      image_url: omniauth_params["info"]["image"],
      twitter_uid: omniauth_params["uid"],
      guest: false
    )
  end

  def self.get_guest_user
    User.create(
      full_name: "Guest",
      first_name: "Guest",
      guest: true
    )
  end
end
