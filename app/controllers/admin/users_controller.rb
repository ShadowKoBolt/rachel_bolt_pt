module Admin
  class UsersController < Admin::BaseController
    def index
      @users = User.where(admin: [nil, false])
    end

    def new
      @user = User.new
      @user = User::AdminCreateForm.new(@user)
    end

    def create
      @user = User.new
      @user = User::AdminCreateForm.new(@user)
      if @user.validate(user_params) && @user.save
        redirect_to admin_users_path, notice: t('.success')
      else
        render action: :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :first_name)
    end
  end
end
