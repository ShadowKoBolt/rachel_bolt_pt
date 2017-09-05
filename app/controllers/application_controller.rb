class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index; end

  private

  def after_sign_in_path_for(resource)
    admin_root_path || request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end
end
