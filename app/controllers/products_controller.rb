class ProductsController < ApplicationController
    def index 
        @products = Product.all 
    end 
    
    def show
        @product = Product.find(params[:id])
    end
    
    def quote # code for UberRUSH shipping quote 
    end 
    
    def order # code for Stripe charge and UberRUSH delivery creation 
        customer = Stripe::Customer.create(
            :email => params[:email],
            :card  => params[:stripeToken]
        )
        
        items = [
            {
                title: params[:title],
                quantity: 1,
                price: params[:price]
            }
        ]
        
        charge = Stripe::Charge.create(
            :customer => customer.id,
            :amount => @amount,
            :description => params[:title],
            :currency => 'usd'
        )
        
        redirect_to done_path(amount: @amount)
        
    rescue Stripe::CardError => e
        flash[:error] = e.message
        redirect_to :back
    end 
    
    def done # code for confirmation page 
    end 
end
