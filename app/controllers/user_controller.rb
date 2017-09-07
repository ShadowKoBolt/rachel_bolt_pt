class UserController < SecureController
  def home
    return redirect_to(admin_root_path) if current_user.admin?
    redirect_to consent_path unless current_user.completed_consent_form?
  end
end
