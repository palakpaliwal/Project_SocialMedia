class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
       @posts = current_user.posts
       @posts = Post.order(created_at: :desc)
    end
    
    def show
         @post = Post.find(params[:id])
         @user = User.find(params[:id])
         
    end
    
    def new
        @post = Post.new
    end
    
    def create

        @post= current_user.posts.create(post_params)
        if @post.save
            redirect_to profile_index_path
        else
          render :new, status: :unprocessable_entity
        end
      
    end
    
    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
    
        if @post.update(post_params)
        redirect_to profile_index_path
        render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        if @post.destroy
            flash[:notice] = "Post deleted successfully"
          else
            flash[:alert] = "Failed to delete the post"
        end
    
        redirect_to profile_index_path
    end
     
    private
      def post_params
        params.require(:post).permit(:content ,:time ,:post_image)
      end
end
