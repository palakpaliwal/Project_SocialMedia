class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
      
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to profile_index_path
      end
    

    def destroy
        @post = Post.find(params[:id])
         @comment.User = current_user 
        @post.comments.destroy

    end
        
    private

    def comment_params
        params.require(:comment).permit(:comments)
    end

end
