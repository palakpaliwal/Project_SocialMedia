class CommentsController < ApplicationController
    before_action :authenticate_user!

    def index
      @comments = Comment.all
      @users = User.all
      @post = Post.find(params[:post_id])
    end

    def create
        debugger
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        @comment.user = current_user                                                                     
        @comment.save
        redirect_to profile_index_path
    end

    def show
        @post = Post.find(params[:post_id])
    end


    def destroy
      @comment = current_user.comments.find(params[:id])
        if @comment.present?
            @comment.destroy
             redirect_to root_path, notice: ' comment deleted'
        end
    end
   
    def comment_button

    end
        
    private

    def comment_params
        params.require(:comment).permit(:comments)
    end

end
