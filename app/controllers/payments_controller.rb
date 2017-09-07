class PaymentsController < SecureController
  def one_off_payment
    @one_off_payment = OneOffPayment.new
  end

  def process_one_off_payment
    @one_off_payment = OneOffPayment.new(one_off_payment_params)
    if @one_off_payment.valid?
      charge = Stripe::Charge.create(amount: @one_off_payment.amount_in_pence,
                                     receipt_email: current_user.email,
                                     currency: "gbp",
                                     description: "Rachel Bolt PT - One off payment",
                                     source: @one_off_payment.token)
      if charge.status == 'succeeded'
        redirect_to payment_success_path
      else
        render action: :one_off_payment, notice: charge.status
      end
    else
      render action: :one_off_payment
    end
  rescue Stripe::InvalidRequestError, Stripe::CardError => e
    flash.now[:notice] = e.message
    render action: :one_off_payment
  end

  private

  def one_off_payment_params
    params.require(:one_off_payment).permit(:amount, :token)
  end
end
