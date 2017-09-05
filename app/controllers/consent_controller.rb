class ConsentController < SecureController
  def show
    @user = current_user
    @user = User::Consent.new(@user)
  end
end
