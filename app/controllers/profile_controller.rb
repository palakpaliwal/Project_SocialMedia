class ProfileController < ApplicationController

    before_action :authenticate_user!

    def index
        @posts = current_user.posts
        @stories = current_user.stories
    end

    def show
        @user = User.find(params[:id])
        @posts = @user.posts
        @users = User.all
    end
      
    def create_post

        @post = current_user.posts.create(post_params)
        redirect_to root_path
        
        if @post.save
        flash[:success] = "Post created successfully"
        else
        flash[:error] = "Error creating post"
        end
              
    end
    
    def edit
    end

    def update

        if @user.update(profile_prams)
            redirect_to @user, notice:"profile update successfully"
        else
            render :edit
        end
    end

    private
    
    def post_params
     params.require(:user).permit(:profile_image)
    end

    private
     
    def comment_params
        params.require(:comment).permit(:content, :time)
    end

    def buttons
        @user = current_user
    end
    
end
