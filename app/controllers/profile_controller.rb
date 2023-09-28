class ProfileController < ApplicationController

    before_action :authenticate_user!

    def show
        @user = User.find(params[:id])
        @post = Post.new
        @post = @user.posts
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

    def index
        @posts = current_user.posts
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
    
end
