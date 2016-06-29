class ChargesController < ApplicationController

protect_from_forgery with: :null_session

	def handle_unverified_request
		forgery_protection_strategy.new(self).handle_unverified_request
	end


	def new
	end

	def create
		@amount = 50
		  customer = Stripe::Customer.create(
			:email => params[:stripeEmail],
			:source  => params[:stripeToken]
			)
		charge = Stripe::Charge.create(
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
