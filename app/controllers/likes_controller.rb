class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @like = current_user.likes.find_or_initialize_by(post: @post)

    if @like.new_record?
      if @like.save
        
        # render json: { liked: true, like_count: @post.likes.count }
      else
        # render json: { error: 'Failed to create like' }, status: :unprocessable_entity
      end
    else
      @like.destroy
      # render json: { liked: false, like_count: @post.likes.count }
    end
    @likes = current_user.likes
    respond_to do |format|
      # debugger
      format.js {}   # Add this line for JavaScript response format
      format.html { }   # Add this line for JavaScript response format
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