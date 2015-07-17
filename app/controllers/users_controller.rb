class UsersController < ApplicationController

	before_action :find_user,  :only => [:show, :edit, :update, :destroy]

	def find_user
		@user = User.find_by(id: params["id"])
	end

	def index

    if params["keyword"].present?
      @keyword = params[:keyword]
      @users = User.where("nick_name LIKE ?", "%#{@keyword}%")
    else
      @users = User.all
    end

	end

	def new
		@user = User.new
		flash.discard(:notice)
    render 'new'
	end
	
	def create

		@user = User.new
		@user.user_name = params["user_name"]
		@user.password = params["password"]
		confirmation=params["repassword"]
		@user.profile_pic_path = params["profile_pic_path"].present? ? params["profile_pic_path"] : "default-user-image.png"
		@user.gender = params["gender"] == "1"
		@user.id_created_time = Time.now.to_datetime
		@user.nick_name = params["nick_name"]
		@user.place = params["nick_name"]
		@user.last_login_time = Time.now.to_datetime
		
		if @user.password == confirmation and @user.save
			session["user_id"] = @user.id
			redirect_to root_url
		else 
			if @user.password != confirmation
				flash[:notice]="password inconsistant."
				render 'new'
			else
				render 'new'
			end
		end
	end

	def destroy
		@user.delete
		redirect_to users_url
	end

	def show
		if @user !=nil
			@follow = Follow.find_by_user_id_and_follower_id(session[:user_id],params[:id])
		end
		if @user == nil
			redirect_to users_url, notice: "User not found."
		end

    if @user.id == session[:user_id]
      @tags = Tag.all
      @user_tags = @user.tags.pluck("tag_name")
    end

	end

	def edit

		if session[:user_id].to_i != params[:id].to_i
      redirect_to root_url, notice: "You cannot edit other users profile!"
    end

	end

	def update
		
		@user.user_name = params["user_name"]
		
		new_password=params["new_password"]
		
		repassword = params["repassword"]
		@user.profile_pic_path = params["profile_pic_path"].present? ? params["profile_pic_path"] : "default-user-image.png"
		@user.nick_name = params["nick_name"]
		@user.last_login_time = Time.now.to_datetime
		
		

		if @user.authenticate(params["password"])
			@user.password=params["password"]
			
		else
			flash[:notice]="Fail to update. Please guarantee your input password is correct."
		end
		if new_password.nil?
			@user.password = params["password"]
		else
			if new_password!=repassword
				flash[:notice]="Your input passwords are not consistant. "
			else
				@user.password = params["new_password"]
			end
		end	
		@user.save
		redirect_to user_url(params["id"])
	end

	def follow
    follow = Follow.new
    follow.follower_id = params["id"]
    follow.user_id = session["user_id"]
    follow.save
    redirect_to user_url(params["id"])
  end

end