class FollowController < ApplicationController

  before_action :require_user

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to log in"
    end

    @user = User.find_by(:id => params[:id])
		@follow = Follow.find_by_user_id_and_follower_id(session[:user_id],params[:id])
  end

	def followee_index
		@follow_users = @user.followees
		render 'followee'
	end

	def follower_index
		@follow_users = @user.followers
		render 'follower'
	end

	def create
		follow = Follow.new
		follow.user_id = session[:user_id]
		follow.follower_id = params[:id]
		follow.save
		redirect_to user_url(params[:id])
	end

  def destroy
		follow = Follow.find_by_user_id_and_follower_id(session[:user_id],params[:id])
		follow.delete
		redirect_to user_url(params[:id])
	end
end