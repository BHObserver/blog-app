class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      flash[:alert] = 'User not found.'
      redirect_to root_path
    end
  end
end
