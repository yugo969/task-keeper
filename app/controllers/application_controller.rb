require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configure_account_update_params, if: :devise_controller?
  before_action :authenticate_user!
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i(name))
  end
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: %i(name))
  end
end
