class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_or_initialize_by(post: @post)

    if @like.new_record?
      if @like.save
        
      else
      end
    else
      @like.destroy
    end
    @likes = @post.likes
    respond_to do |format|
      format.js   
      format.html
      format.turbo_stream
    end
  
  end

  def destroy
    @like = current_user.likes.find(params[:id])
    @post = @like.post
    @like.destroy
    render json: { liked: false, like_count: @post.likes.count }
  end

  private
    
    def like_params
        params.require(:like).permit(:post_id)
    end
end