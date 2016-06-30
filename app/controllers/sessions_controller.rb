class SessionsController < ApplicationController
  def create
    user = User.find_by(:email => params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      session[:user_name] = user.full_name
      redirect_to '/groups'
    else
      flash[:error] = "Invalid username or password"
      redirect_to :back
    end
  end

  def destroy
    session.delete(:user_id)
    session.delete(:user_name)
    redirect_to :root
  end
end
