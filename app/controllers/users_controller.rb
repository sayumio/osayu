class UsersController < ApplicationController
  def index
  end

  def new
    @user =User.new
  end

  def create
    User.create(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:sign_up, keys:[:nickname, :sei, :mei, :kanasei, :kanamei, :birthday])
  end
end
