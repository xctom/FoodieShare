class SessionsController < ApplicationController

  #before action for new and create
  #if user already logged in, redirect to posts page

  before_action :require_no_user, :only => [:new, :create]
  before_action :require_user, :only => [:delete]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to log in"
    end
  end

  def require_no_user
    if session[:user_id]
      redirect_to posts_url
    end
  end

  def new
    @user = User.new
  end

	def create
		user = User.find_by(user_name: params[:user_name])
    if user
      
      if user.authenticate(params[:password])
        session["user_id"] = user.id
        redirect_to root_url
      else
        @error = "Your password is wrong."
        redirect_to "/login", notice: "Unknown password."

      end
    else
      @error = "Unknown email."
      redirect_to "/login", notice: "Unknown email."
    end

  end

  def delete
    session.delete(:user_id)
    redirect_to root_url
  end
end
