class FavoritesController < ApplicationController
  

  def new
    @favorite = Favorite.new
  end

  def create
    @fav = Favorite.new(event_id: params[:favorite][:event_id])
    @fav.user_id = current_user.id
    @fav.save
    redirect_to "/events/#{params[:favorite][:event_id]}"
  end

  def destroy
    fav = Favorite.where(event_id: params[:id], user_id: current_user.id)
    fav.each {|fav| fav.destroy}
    redirect_to "/events/#{params[:id]}"
  end

end
