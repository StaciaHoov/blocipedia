class WikisController < ApplicationController
  def index
    @wikis = Wiki.all
    authorize @wikis
  end

  def show
    @wiki = Wiki.find(params[:id])
    @stripe_btn_data = {
            key: "#{ Rails.configuration.stripe[:publishable_key] }",
            description: "Membership Upgrade - #{current_user.name}",
            amount: 1500
        }
  end

  def new
    @wiki = Wiki.new
    @stripe_btn_data = {
      key: "#{ Rails.configuration.stripe[:publishable_key] }", 
      description: "Membership Upgrade - #{current_user.name}",
      amount: 1500
    }
    authorize @wiki
  end
  
  def create
    @wiki = Wiki.new(wiki_params)
    authorize @wiki
    if @wiki.save
      flash[:notice] = "Wiki successfully created!"
      redirect_to @wiki
    else
      flash[:error] = "There was an error creating a new wiki. Please try again."
      render :new
    end
  end
    
  def edit
    @wiki = Wiki.find(params[:id])
    authorize @wiki
  end
  
  def update
    @wiki = Wiki.find(params[:id])
    authorize @wiki
    
    if @wiki.update_attributes(wiki_params)
      flash[:notice] = "Wiki was updated."
      redirect_to @wiki
    else
      flash[:error] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end
  
  def destroy
    @wiki = Wiki.find(params[:id])
    
    if @wiki.destroy
      flash[:notice] = "Wiki deleted."
      redirect_to wikis_path
    else
      flash[:notice] = "There was an error deleting wiki. Please try again."
      render :destroy
    end
  end
    
  private
  
  def wiki_params
    (params.require(:wiki).permit(:title, :body))
  end
end
