class User < ActiveRecord::Base
  def self.get_omniauth_user(params={})
    omniauth_params = params[:omniauth_params]
    binding.pry
    if omniauth_params.nil? || omniauth_params["info"].nil? || omniauth_params["info"]["email"].nil?
      return nil
    end

    user = User.find_by(email: omniauth_params["info"]["email"])
    if user
      return user
    end

    User.create(
      email: omniauth_params["info"]["email"],
      first_name: omniauth_params["info"]["first_name"],
      last_name: omniauth_params["info"]["last_name"],
      full_name: omniauth_params["info"]["name"],
      image_url: omniauth_params["info"]["image"],
      # google_uid: omniauth_params["uid"],
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
