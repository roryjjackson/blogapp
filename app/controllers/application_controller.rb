class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit::Authorization

  after_action  :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  # after_action :verify_authorized, except: :index, unless: :about_controller?
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :author, :admin, :photo])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :author, :admin, :photo])
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
