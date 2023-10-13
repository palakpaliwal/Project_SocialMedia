class LikesController < ApplicationController
    before_action :authenticate_user!
    def create 
        # debugger
      @like = current_user.likes.new(post_id: params[:post_id])
        if @like.save
            render json: { liked: true, like_count: @like.post.likes.count }
        else
            render json: { liked: false, like_count: @like.post.likes.count }
        end   
    
        end
        
    def destroy
        @like = Current_user.likes.find(params[:id])
        @like.destroy
        render json: { liked: false, like_count: @like.post.likes.count }
    end
    
    def like_params
        params.require(:like).permit(:post_id)
    end
end