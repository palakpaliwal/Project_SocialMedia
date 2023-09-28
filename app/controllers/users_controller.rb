class UsersController < ApplicationController
  before_action :authenticate_user!
 
    def index

      @users =User.all
      @posts = Post.all
      # @posts = current_user..all

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
  
    
    


end
