class CommentsController < ApplicationController

  
    def create
        @post = Post.find(params[:post_id])
        @comment =@post.comments.create(comment_params)
        
   
        if @comment.save
           redirect to @post
           flash[:success] = "comment created successfully"
        else
            render 'posts/show'
        end
    end

    def destroy
        @post = Post.find(params[:id])
         @comment.User = current_user 
        @post.comments.destroy

    end
        
    private

    def comment_params
        params.require(:comment).permit(:email, :content)
    end

end
