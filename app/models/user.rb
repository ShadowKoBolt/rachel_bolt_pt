class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :trackable, :validatable

  class AdminCreate < Reform::Form
    model :user
    properties :email, :first_name, :password, :reset_password_token
    validates :first_name, presence: true
    validates :email, presence: true, email: true
    validates_uniqueness_of :email

    def save
      self.password = SecureRandom.hex
      self.reset_password_token = SecureRandom.hex
      super
    end
  end

  class SetPassword < Reform::Form
    model :user
    properties :email, :password, :password_confirmation, :first_name, :reset_password_token

    validates :email, presence: true, email: true
    validates :password, :password_confirmation, presence: true
    validates :password, confirmation: true, length: { minimum: 5 }
    validates_uniqueness_of :email

    def save
      self.reset_password_token = nil
      super
    end
  end

  class Consent < Reform::Form
    model :user
    properties :first_name, :last_name, :date_of_birth, :address, :mobile, :occupation, :support_contact,
               :catchup_contact, :skype_username, :smoke, :pregnant, :medical_heart, :medical_chest_pain,
               :medical_dizzy, :medical_high_blood_pressure, :medical_arthritis, :medical_asthma,
               :medical_bone_or_joint_problems, :medical_back_problems, :medical_epilepsy, :medical_sports_injury,
               :medical_depression, :medical_other
    property :accept_1, virtual: true
    property :accept_2, virtual: true

    validates :first_name, :last_name, :mobile, presence: true
    validate :accept_terms

    def options_for_support_contact
      [ 'Whatsapp', 'Email', 'Text', 'Facebook messenger' ]
    end

    def options_for_catchup_contact
      [ 'Skype', 'Phone', 'Email' ]
    end

    private

    def accept_terms
      errors.add(:accept_1, 'must be accepted') if accept_1 != '1'
      errors.add(:accept_2, 'must be accepted') if accept_2 != '1'
    end
  end
end
