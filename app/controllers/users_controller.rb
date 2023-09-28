class UsersController < ApplicationController
  before_action :authenticate_user!
 
    def index
      
    end
  
    def show
     
    end
  
    def new
      @user = user.new
    end
  
    def create


    end

    def destroy
    end
  
    
    


end
