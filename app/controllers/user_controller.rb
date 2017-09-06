class UserController < SecureController
  def home
    redirect_to consent_path unless current_user.completed_consent_form?
  end
end
