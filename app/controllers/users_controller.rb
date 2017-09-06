class UsersController < ApplicationController
  def set_password
    @user = User.find_by_reset_password_token(params[:reset_password_token])
    @user = User::SetPassword.new(@user)
    if request.patch?
      if @user.validate(reset_password_params) && @user.save
        redirect_to user_root_path, notice: 'Information saved'
      end
    end
  end

  private

  def reset_password_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
