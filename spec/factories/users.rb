FactoryBot.define do
  factory :user do
    sequence(:email) { |i| "user#{i}@example.com" }
    password 'password'

    factory :admin do
      admin true
    end
  end

  factory :user_admin_create, class: User do
    sequence(:email) { |i| "user_admin_create#{i}@example.com" }
    first_name 'first_name'
  end

  factory :user_set_password, class: User do
    sequence(:email) { |i| "user_set_password#{i}@example.com" }
    password 'password'
    password_confirmation 'password'
  end

  factory :user_consent, class: User do
    first_name 'first_name'
    last_name 'last_name'
    date_of_birth '01/01/2000'
    address <<-ADDRESS
      Address line 1
      Address line 2
      City
      Region
      Postcode
    ADDRESS
    mobile '0123456789'
    occupation 'occupation'
    support_contact User::ConsentForm::OPTIONS_FOR_SUPPORT_CONTACT.first
    catchup_contact User::ConsentForm::OPTIONS_FOR_CATCHUP_CONTACT.first
    skype_username 'skype_username'
    smoke true
    pregnant true
    medical_heart true
    medical_chest_pain true
    medical_dizzy true
    medical_high_blood_pressure true
    medical_arthritis true
    medical_asthma true
    medical_bone_or_joint_problems true
    medical_back_problems true
    medical_epilepsy true
    medical_sports_injury true
    medical_depression true
    medical_other 'medical_other'
    accept_1 true
    accept_2 true
  end
end
