module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end

  def featured_event
    @featured_event = Event.all.sample
  end
  
end
