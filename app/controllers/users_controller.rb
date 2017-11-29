class UsersController < ApplicationController
  def set_password
    @user = User.find_by(reset_password_token: params[:reset_password_token])
    @user = User::SetPasswordForm.new(@user)
    return unless request.patch? &&
                  @user.validate(reset_password_params) &&
                  @user.save
    sign_in(@user.model)
    redirect_to user_root_path, notice: t('.success')
  end

  private

  def reset_password_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
