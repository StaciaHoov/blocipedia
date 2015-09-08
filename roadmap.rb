Wiki.rb
  def collaborator_list
    self.users.each do |user|
      user.name
    end
  end
 # cant get name. only user hashes.  
  
  
  Edit.html.erb
         <h4>Current Collaborators:</h4>
        <ul class="list-unstyled">
            <% @wiki.collaborators.each do |user| %>
                <li><%= user.user_id %></li>
            <% end %>
        </ul><br> 
# can get user_id but how to get name?	



        <h4>Current Collaborators:</h4>
         <ul>
                <% @wiki.collaborators.each do |collaborator| %>
                    <li><%= @user.find_by(id: collaborator.user_id).name %> 
                    <small><%=link_to "  (delete)", wiki_collaborator_path(@wiki, collaborator.id), method: :delete %></small></li>
                <% end %>
        </ul><br> 
		# This works!

Problems
Why is the wiki created without user_id now?
downgraded users still viewing and editing private wikis