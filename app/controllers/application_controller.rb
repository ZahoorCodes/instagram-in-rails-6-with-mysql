class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :store_current_location!, if: :storable_location?

    # protected
    # def authenticate_user!
    #   redirect_to root_path  unless user_signed_in?      
    # end
    
    protected
    # def after_sign_in_path_for(resource)
    #   dashboard_index_path 
    # end
  
    protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:username, :website, :bio,:phone,:gender,:avatar])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name,:username, :website, :bio,:phone,:gender,:avatar])
    end
  
    def store_current_location!
      store_location_for(:user, request.url)
    end
    def storable_location?
      request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end
    # def after_sign_out_path_for(resource)
    #   # request.referrer || root_path
    #   root_path
    # end
end
