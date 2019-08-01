class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/', notice: "You have logged in successfully."
    else
      redirect_to '/login', notice: "You entered wrong combination of email and password."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "You have logged out successfully."
  end
end
