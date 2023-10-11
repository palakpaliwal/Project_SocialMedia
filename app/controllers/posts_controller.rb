class PostsController < ApplicationController
    before_action :authenticate_user!

    def index
       @posts = current_user.posts
    end
    
    def show
         @post = Post.find(params[:id])
         

    end
    
    def new
        @post = Post.new
    end
    
    def create

        @post= current_user.posts.create(post_params)
        if @post.save
            redirect_to root_path
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
        redirect_to root_path
        else
        render :edit, status: :unprocessable_entity
        end
    end
    
    def destroy
        @post = Post.find(params[:id])
        @post.destroy
    
        redirect_to profile_index_path, status: :see_other
    end
     
    private
      def post_params
        params.require(:post).permit(:content ,:time ,:post_image)
      end
end
