class CommentsController < ApplicationController
  before_action :check_for_logged_in, only: [:new, :create, :edit, :update]

  def index
    @event = Event.find_by_id(params[:event_id])
    if @event
      @comments = @event.comments
    else
      redirect_to events_path
    end
  end

  def new
    @event = Event.find_by_id(params[:event_id])
    @comment = @event.comments.build
  end


  def create
    @event = Event.find_by_id(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.commenter_id = current_user.id

    if @comment.save
      redirect_to event_path(@comment.event)
    else
      render :new
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:content, :event_id)
    end
end
