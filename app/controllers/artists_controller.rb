class ArtistsController < ApplicationController
  before_action :check_for_logged_in

  def show
    @artist = Artist.find(params[:id])
    @events = Event.where(artist_id: params[:id])
  end

  def index
    @artists = Artist.all
    
  end

end
