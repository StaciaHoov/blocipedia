class UsersController < ApplicationController

    def update
        current_user.update_attributes(role: "standard")
        current_user.publicize_wikis       
        
        flash[:alert] = "You have been downgraded to a Standard membership. Your private wikis can now be viewed publicly. "
        redirect_to wikis_path(current_user)
    end
end