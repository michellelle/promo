class ChargesController < ApplicationController
  has_secure_token
  has_secure_token :auth_token
end
  
    def new
    end
    
    def create
      # Amount in cents
      @price = params[:price]
   
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      
      require "stripe"
        Stripe.api_key = "sk_test_NjOOMGCyPpGY8xvpOxjETJuy"

      
      charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @price,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
