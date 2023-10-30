class ProfileController < ApplicationController

    before_action :authenticate_user!

    def index
        @user = current_user
        @posts = current_user.posts
        @stories = current_user.stories
        @posts = current_user.posts.order(created_at: :desc)
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts
        @users = User.all
    end

    def update

        if @user.update(profile_prams)
            redirect_to @user, notice:"profile update successfully"
        else
            render :edit
        end
    end

   
    
end
