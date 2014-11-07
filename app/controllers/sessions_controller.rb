class SessionsController < ApplicationController
  def create
    user = User.get_omniauth_user(omniauth_params: request.env["omniauth.auth"])
    if user.nil?
      redirect_to "/", notice: "Could not log in"
    else
      log_in_user(user)
      redirect_to "/", notice: "Logged in #{user.id}"
    end
  end

  def destroy
    log_out_user
    redirect_to "/", notice: "You've been logged out."
  end
end
