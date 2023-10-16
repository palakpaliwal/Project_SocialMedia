class StoriesController < ApplicationController
    before_action :authenticate_user!

    def index
        @stories = current_user.stories
    end

    def new
        @story = Story.new
    end

    def create
        @story = current_user.stories.create(story_params)
        if @story.save
        redirect_to posts_path, notice: 'Story created successfully.'
        else
        flash[:alert] = 'Story could not be created.'
        render :new
        end
    end

    def show
        @story = Story.find(params[:id])
        if @story.present?

          if @story.expires_at.present? && @story.expires_at > Time.now

            else
            redirect_to root_path, alert: 'Story has expired.'
          end

        end
    end

    def destroy
        @story = Story.find(params[:id])
    
        if @story.destroy
            flash[:notice] = "Story deleted successfully"
            render :show
          else
            flash[:alert] = "Failed to delete the story"
        end
    
        redirect_to profile_index_path
    end


    private

    def story_params
        params.require(:story).permit(:content, :image,:expires_at)
    end

end