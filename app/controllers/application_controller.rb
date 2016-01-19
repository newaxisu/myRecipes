class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # make the new methods visable to the views
  helper_method :current_user, :logged_in?
  
  # methods here are available to controllers
  def current_user
    #save to current_user instance variable to prevent banging on the database
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  def logged_in?
    # turn value into boolean
    !!current_user
  end
  
end
