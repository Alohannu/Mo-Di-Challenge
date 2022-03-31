class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[username email])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login email username])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[login username email])
  end
end
