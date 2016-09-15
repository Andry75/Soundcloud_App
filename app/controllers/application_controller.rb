class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_devise_params, if: :devise_controller?

  protected

  def no_sync_content(content_type)
    flash[:warning] = "Oops!! You have not synchronized #{content_type}."
    redirect_to status_path
  end

  private

  def configure_devise_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    devise_parameter_sanitizer.permit(:account_update, keys: [:email])
  end
end
