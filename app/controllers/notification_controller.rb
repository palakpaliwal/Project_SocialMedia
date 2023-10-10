class NotificationController < ApplicationController

    def index
       @users = User.all
    end
  
end
