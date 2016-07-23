class ChargesController < ApplicationController

    def new
    end
    
    def create
      # Amount in cents
      @amount = params[:amount]
   
      customer = Stripe::Customer.create(
        :email => params[:stripeEmail],
        :source  => params[:stripeToken]
      )
      
      require "stripe"
        Stripe.api_key = "sk_test_NjOOMGCyPpGY8xvpOxjETJuy"

      
      charges = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => @amount,
        :description => 'Rails Stripe customer',
        :currency    => 'usd'
      )
    
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
end
