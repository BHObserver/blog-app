class UsersController < ApplicationController


  def index
    @users = User.includes(:posts).all
  end

  def show
    @user = User.find(params[:id])
    if @user.nil?
      flash[:notice] = 'Signed out successfully.'
      redirect_to root_path
    end
  end

  def user_sign_out
    sign_out current_user
    redirect_to new_user_session_path notice: 'Signed out successfully.'
  end
end
