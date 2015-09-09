class CollaboratorsController < ApplicationController
    
    def create
        params['users'].each do |id|
            @wiki = Wiki.find(params[:wiki_id])
            @collaborator = @wiki.collaborators.build(user_id: id)
    
            if @collaborator.save
                flash[:notice] = "Collaborators have been added to this wiki."
            else
                flash[:error] = "There was a problem adding collaborators to this wiki. Check to see if individuals have already been added."
            end
        end
        redirect_to edit_wiki_path(@wiki)
    end

    def destroy
        @wiki = Wiki.find(params[:wiki_id])
        @collaborator = Collaborator.find(params[:id])
 
        if @collaborator.destroy
            flash[:notice] = "Collaborator removed from wiki"
        else
            flash[:error] = "There was a problem removing the collaborator from the wiki. Please check spelling and try again."
        end
        redirect_to edit_wiki_path(@wiki)
    end
end