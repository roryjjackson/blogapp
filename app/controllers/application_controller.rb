class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name author admin])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name author admin])
  end
end
