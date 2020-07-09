class EventsController < ApplicationController
   before_action :check_for_logged_in

  def new
   @event = Event.new
   @event.build_genre
  end

  def create
    @event = current_user.events.build(event_params)
    
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = Event.order_by_title
  end

  def show
    set_event
    @favorite = Favorite.new
    @comments = @event.comments
  end

  def edit
    set_event
  end

  def update
    set_event
    if @event.update(event_params)
      redirect_to event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    set_event
    @event.destroy
    redirect_to events_path
  end

  def search
    # @events = Event.order_by_date.where("(title || about_content || category) LIKE ?", "%" + params[:search] + "%")
    # ^case sensitive^ or (below) can only search one attr/field
    # @events = Event.order_by_date.where(Event.arel_table[:title].matches("%#{params[:search]}%")) #https://www.scimedsolutions.com/blog/arel-part-i-case-insensitive-searches-with-partial-matching
  
    @events = Event.where(
        %i(title description time link)
        .map { |field| Event.arel_table[field].matches("%#{params[:search]}%")}
        .inject(:or)
        )   

        @genres = Genre.where(
          %i(name)
          .map { |field| Genre.arel_table[field].matches("%#{params[:search]}%")}
          .inject(:or)
          )
   
end


  private

  def set_event
    @event = Event.find_by(id: params[:id])
    if !@event
      redirect_to events_path
    end
  end

  def event_params
    params.require(:event).permit(:title, :link, :time, :description, :genre_id, genre_attributes: [:name])
  end
end