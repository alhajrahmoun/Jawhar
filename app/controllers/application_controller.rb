class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :username, :avatar, :avatar_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :username, :avatar, :avatar_cache])
  end

  def after_sign_in_path_for(resource)
    gists_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

end
