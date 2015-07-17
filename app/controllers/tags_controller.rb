class TagsController < ApplicationController

  before_action :require_user

  def require_user
    if session[:user_id].blank?
      redirect_to root_url, notice: "You need to log in"
    end

    @user = User.find_by(id:session[:user_id])
  end

  def update

    if params["tags"]

      # clear marks
      @user.marks.delete_all

      # add tags

      params["tags"].each do |id|
        mark = Mark.new
        mark.user_id = @user.id
        mark.tag_id = id
        mark.save
      end

    end

    redirect_to user_url(@user.id)

  end

end