class OneOffPayment
  include ActiveModel::Model

  attr_accessor :amount, :token

  validates :amount, presence: true, numericality: true
  validates :token, presence: true

  def amount_in_pence
    (amount.to_f * 100.0).to_i
  end
end
