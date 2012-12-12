class StaticPagesController < ApplicationController
  def home
    @pairings = Pairing.all
    @items = Item.all
  end

  def help
  end

  def about
  end

  def contact
  end

  def tags
    #Get all tags that match
    @tags = ActsAsTaggableOn::Tag.where("tags.name LIKE ?", "%#{params[:q]}%")

    #Add new tag if does not exist
    @return = @tags.collect {|t| {:id => t.name, :name => t.name}}
    @return << ({id: params[:q], name: params[:q]})
    #if @return.empty?
      #@return << ({id: params[:q], name: params[:q]})
    #end

    respond_to do |format|
      format.json {render :json => @return}
    end
  end

end
