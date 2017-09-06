class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    redirect_to user_root_path if current_user
  end

  private

  def after_sign_in_path_for(resource)
    admin_root_path || request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
