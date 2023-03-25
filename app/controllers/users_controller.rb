class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def create
    @user = User.new(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
