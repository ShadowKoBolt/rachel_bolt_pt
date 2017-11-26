module Admin
  class BaseController < ApplicationController
    before_action :authenticate_user!
    before_action :authorize_admin!

    layout 'application_admin'

    private

    def authorize_admin!
      message = 'You are not authorized to view this content'
      redirect_to(root_path, error: message) unless current_user.admin?
    end
  end
end
