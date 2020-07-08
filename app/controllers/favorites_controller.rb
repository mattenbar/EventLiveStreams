class FavoritesController < ApplicationController
  belongs_to :user
  belongs_to :event

  def new
    @favorite = Favorite.new
  end

  def create
    @favorite = current_user.favorite.build(user_id: current_user.id, event_id: params[:id])
  end

  def destroy
    set_event
    @event.destroy
    redirect_to events_path
  end

end
