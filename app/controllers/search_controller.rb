class SearchController < ApplicationController

    def index
      
        @posts = Post.all
    end
  
    def create
    end

    def destroy
    end
  

end
