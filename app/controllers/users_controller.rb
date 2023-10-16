class UsersController < ApplicationController
  before_action :authenticate_user!
 
    def index
     
      @posts = Post.where(user_id: current_user.following.ids)
       
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
      
      @users =User.all
      @posts = Post.all

    end
  
    def total_user
      @users = User.all
    end
    


end
