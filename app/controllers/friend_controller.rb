class FriendController < ApplicationController
    before_action :authenticate_user!
    
    def index
        @users = User.all
    end
    
    def show 
        @user = User.find(params[:id])
    end

    def follow
        @user = User.find(params[:id])
      current_user.send_follow_request_to(@user)
      redirect_to profile_path(@user)
    end

    def unfollow
        @user = User.find(params[:id])
        current_user.unfollow(@user)
        redirect_to profile_path
    end

    def accept
        @user = User.find(params[:id])
        current_user.accept_follow_request_of(@user)
        # make_it_a_friend_request
        redirect_to root_path
    
    end

    def decline
        @user = User.find(params[:id])
        current_user.decline_follow_request_of(@user)
        redirect_to root_path

    end

    def cancle 
        @user = User.find(params[:id])
        current_user.remove_follow_request_for(@user)
        redirect_to root_path
    end

    def sent_follow_request_to?
        @user = User.find(params[:id])
      current_user.sent_follow_request_to?(@user)     
    end

    def followers
       
    end

    def following
        @following = current_user.following
    end

    private

    def make_it_a_friend_request
        current_user.send_follow_request_to(@user)
        @user.accept_follow_request_of(current_user)
    end

    # def make_it_a_unfriend_request
    #     @user.unfollow(current_user) if @user.mutual_following_with(current_user)
    # end
  

   


end
