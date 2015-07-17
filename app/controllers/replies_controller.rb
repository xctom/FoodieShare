class RepliesController < ApplicationController

  before_action :require_user, :only => [:create, :destroy]

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to log in"
    end
  end

  def create

    verified = params.permit(:post_id, :content)

    reply = Reply.new(verified)
    reply.user_id = session[:user_id]
    reply.time = Time.now.to_datetime

    if reply.save
      redirect_to posts_url
    else
      redirect_to posts_url, notice: "Reply send failure"
    end

  end

  def destroy
    #only can delete user's own replies

    reply = Reply.find_by(id:params[:id])

    if reply && reply.user_id == session[:user_id]

      reply.delete

      redirect_to posts_url
    else
      redirect_to posts_url, notice: "Reply delete failure"
    end

  end

end