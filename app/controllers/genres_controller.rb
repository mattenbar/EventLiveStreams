class GenresController < ApplicationController
  before_action :check_for_logged_in

  def index
    @genres = Genre.order_genres
  end

  def show
    @genre = Genre.find_by(id: params[:id])
    @events = Event.where(genre_id: params[:id])
  end

end
