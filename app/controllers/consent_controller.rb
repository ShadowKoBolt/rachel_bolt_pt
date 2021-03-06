class ConsentController < SecureController
  def show
    @user = User::ConsentForm.new(current_user)
  end

  def update
    @user = User::ConsentForm.new(current_user)
    if @user.validate(user_consent_params) && @user.save
      redirect_to user_root_path, notice: t('.success')
    else
      render action: :show
    end
  end

  private

  def user_consent_params
    attributes = %i[first_name last_name date_of_birth address mobile
                    occupation support_contact catchup_contact skype_username
                    smoke pregnant accept_1 accept_2]
    attributes << medical_atttributes
    params.require(:user_consent).permit(attributes)
  end

  def medical_atttributes
    %i[medical_heart medical_chest_pain medical_dizzy
       medical_high_blood_pressure medical_arthritis medical_asthma
       medical_bone_or_joint_problems medical_back_problems medical_epilepsy
       medical_sports_injury medical_depression medical_other]
  end
end
