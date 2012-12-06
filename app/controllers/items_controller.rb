class ItemsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :index]

  def index
    @user = User.find(params[:user_id])
    @items = @user.items.paginate(page: params[:page])
    @item = @user.items.build if signed_in?
  end

  def create
    @item = current_user.items.build(params[:item])
    if @item.save
      flash[:success] = "Added to Collection!"
      redirect_to user_items_path(current_user)
    else
      flash[:error] = "We were unable to add your latest item. Please try again later."
      redirect_to user_items_path(current_user)
    end
  end

  def destroy
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
