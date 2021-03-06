class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/home'
    else
      render :new
    end
  end

  def show
    @user = User.find_by(:id => params[:id])
  end

  def profile
    if logged_in?
    @events = Event.where(user_id: current_user.id).order("lower(title) ASC")
    @user = User.find_by(id: current_user.id)
    @favorites = @user.favorited_events.order("lower(title) ASC")
    render :show
    else
      redirect_to '/'
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :email, :password)
  end

end
