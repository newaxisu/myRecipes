class LoginsController < ApplicationController
  def new
    # do nothing, just render the new.html.erb file
  end

  def create
    chef = Chef.find_by(email: params[:email])
    if chef && chef.authenticate(params[:password])
        session[:chef_id] = chef.id
        flash[:success] = "You are logged in"
        redirect_to recipes_path
    else
      flash.now[:danger] = "Your email or your password don't match"
      render 'new'
    end
  end
  
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
end