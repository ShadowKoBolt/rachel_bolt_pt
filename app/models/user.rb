class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :trackable, :validatable

  def completed_consent_form?
    User::ConsentForm.new(self).validate(accept_1: '1', accept_2: '1')
  end

  def name
    "#{first_name} #{last_name}"
  end
end
