class ChargesController < ApplicationController

    def new
        @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Membership Upgrade - #{current_user.name}",
            amount: 1500
        }
    end

    def create
        #creates customer object, for associating with the charge
        customer = Stripe::Customer.create(
            email: current_user.email,
            card: params[:stripeToken]
        )
        
        charge = Stripe::Charge.create(
            customer: customer.id,
            amount: 1500,
            description: "Membership Upgrade - #{current_user.email}",
            currency: 'usd'
        )

        if charge
            current_user.update_attributes(role: "premium")
            flash[:notice] = "Thank you, #{current_user.name || current_user.email}. You have been upgraded to a Premium membership."
            redirect_to wikis_path(current_user)
        end
        
        rescue Stripe::CardError => e
            flash[:error] = e.message
            redirect_to new_charge_path
    end
end
