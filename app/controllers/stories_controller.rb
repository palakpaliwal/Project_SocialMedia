class StoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @stories=Story.all
      end
    
      def new
        @story = Story.new
      end
    
      def create
        @story = current_user.stories.new(story_params)
        @story.expires_at = DateTime.now + 1.day
        if @story.save
            redirect_to users_path, notice: 'Story created successfully.'
        else
            flash[:alert] = 'Story could not be created.'
            render 'users/index'
        end
      end
    
      def show
        @story = Story.find(params[:id])
        @story.expires_at = DateTime.now + 1.day
        @stories = Story.where(user_id: @story.user_id)
        if @story.present?
           
          if @story.expires_at.present? && @story.expires_at > Time.now

            else
            redirect_to root_path, alert: 'Story has expired.'
          end

        end
      end
    
      private
    
      def story_params
        params.require(:story).permit(:content, :image,:expires_at)
      end

end