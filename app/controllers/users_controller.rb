class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password)
  end

end
