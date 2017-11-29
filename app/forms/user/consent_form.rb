class User
  class ConsentForm < Reform::Form
    OPTIONS_FOR_CATCHUP_CONTACT = %w[Skype Phone Email].freeze
    OPTIONS_FOR_SUPPORT_CONTACT = ['Whatsapp', 'Email', 'Text',
                                   'Facebook messenger'].freeze

    properties :first_name, :last_name, :date_of_birth, :address, :mobile,
               :occupation, :support_contact, :catchup_contact, :skype_username,
               :smoke, :pregnant, :medical_heart, :medical_chest_pain,
               :medical_dizzy, :medical_high_blood_pressure, :medical_arthritis,
               :medical_asthma, :medical_bone_or_joint_problems,
               :medical_back_problems, :medical_epilepsy,
               :medical_sports_injury, :medical_depression, :medical_other,
               :stripe_customer_id, :email
    property :accept_1, virtual: true
    property :accept_2, virtual: true

    validates :first_name, :last_name, :mobile, :occupation, :address,
              :date_of_birth, presence: true
    validate :accept_terms

    def save
      customer = Stripe::Customer.create(
        description: "#{first_name} #{last_name}",
        email: email
      )
      self.stripe_customer_id = customer.id
      super
    end

    private

    def accept_terms
      errors.add(:accept_1, 'must be accepted') if accept_1 != '1'
      errors.add(:accept_2, 'must be accepted') if accept_2 != '1'
    end
  end
end
