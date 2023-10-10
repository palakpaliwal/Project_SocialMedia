class CommentsController < ApplicationController

    def index
        
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
      end
    

    # def destroy
    #     @post = Post.find(params[:id])
    #      @comment.User = current_user 
    #     @post.comments.destroy

    # end
        
    private

    def comment_params
        params.require(:comment).permit(:comments)
    end

end
