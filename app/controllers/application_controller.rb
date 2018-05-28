class ApplicationController < ActionController::Base
  	before_action :authenticate_user!, except: [:about, :index]
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

	 protected

	def configure_permitted_parameters
	    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])

    end

    def after_sign_in_path_for(resource)
    	user_path(current_user.id)
	end
end
