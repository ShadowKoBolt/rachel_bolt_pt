class User
  class SetPasswordForm < Reform::Form
    model :user
    properties :email, :password, :password_confirmation, :first_name,
               :reset_password_token

    validates :email, presence: true, email: true
    validates :password, :password_confirmation, presence: true
    validates :password, confirmation: true, length: { minimum: 4 }
    validates_uniqueness_of :email

    def save
      self.reset_password_token = nil
      super
    end
  end
end
