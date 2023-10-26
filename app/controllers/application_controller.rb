class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
        # devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :bio, :email, :password, :profile_image)}
        devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image ,:name ,:bio])
    end


    
end
