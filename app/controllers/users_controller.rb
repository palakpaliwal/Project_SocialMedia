class UsersController < ApplicationController
  before_action :authenticate_user!
 
    def index
      @users = User.all
      @posts = Post.where(user_id: current_user.following.ids).order(created_at: :desc)
      @stories = Story.where(user_id: current_user.following.ids).where('expires_at > ?', Time.now).group_by(&:user_id)
    end
  
    def show
        @user = current_user
        @posts = current_user.posts
    end
  
    def new
      
    end
  
    def create


    end

    def destroy
    end

    def search
      @q = User.ransack(params[:q])
      @users= @q.result(distinct: true)
    end
  
    def total_user
      @users = User.all
    end

end
