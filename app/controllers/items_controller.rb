class ItemsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :index]

  def index
    @user = User.find(params[:user_id])
    @items = @user.items.paginate(page: params[:page])

    #Form for adding is in same page
    #TODO: refactor this to the correct place
    if signed_in?
      @item = @user.items.build
    end

    respond_to do |format|
      format.json {render json: @items}
      format.html
    end
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

end
