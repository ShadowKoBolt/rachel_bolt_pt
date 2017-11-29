class User
  class AdminCreateForm < Reform::Form
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
end
