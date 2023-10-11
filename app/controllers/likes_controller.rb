class LikesController < ApplicationController
    before_action :authenticate_user!
    def create 
        # debugger
      @like = current_user.likes.new(post_id: params[:post_id])
        if @like.save
        flash[:atert] = "you already liked"
        end
        redirect_to root_path
    end
        
    def destroy
        @like = Current_user.likes.find(params[:id])
        @like.destroy
    end
    
    def like_params
        params.require(:like).permit(:post_id)
    end
end
