class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to cookies[:path] ? cookies[:path] : '/'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_cofirmation)
  end
end
