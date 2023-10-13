class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
      @comments = Comment.all
      @users = User.all
    end

    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user_id = current_user.id
        @comment.save
        redirect_to profile_index_path
      end
    

    def destroy
        @comment = Comment.find(params[:id])
        if current_user == @comment.user
            @comment.destroy
            redirect_to @comment.post, notice: ' comment deleted'

        else
            redirect_to @comment.post, notice: ' u cannot delete this comment'
        end

    end
   
    def comments

    end

        
    private

    def comment_params
        params.require(:comment).permit(:comments)
    end

end
