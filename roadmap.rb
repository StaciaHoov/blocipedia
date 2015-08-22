## Callbacks - After_initialize to set default user role but need to 
# call that method in a filter in your model. (probably a before_create filter)
_____________________________________

# user story alternative 1 - 
# 1. user is existing standard member
# 2. user clicks “Hello {user}”  link to go to registration/edit page
# 3. clicks button (or checkbox) to update membership
# 4. routed to User#upgrade
# 	-if already premium, message 'already premium', redirect_to wiki index page 
#   - else if standard membership, update attribute to premium, redirect_to charges/new view
# 5. submit payment for updated membership
# 6. successful charge redirect_to wikis page
# 7. once premium member, show 'private' option for new and edit wiki views
	
	
	def upgrade
		@user = current_user
		
		if @user.standard?
			@current_user.update_attributes(role: 'premium')
			redirect_to new_charge_path
		else
			flash[:notice] = 'You already have a premium membership'
			redirect_to
			
	
	 # upgrade link something like this?
       <%= link_to "Upgrade", upgrade_path(current_user), :confirm => "You sure?", :method => :post %>