class UsersController < ApplicationController
  def show
    if current_user
      render json: current_user
    else
      user = User.get_guest_user
      log_in_user(user)
      render json: user
    end
  end
end