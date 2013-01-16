class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]
  before_filter :correct_user, only: [:edit, :update, :feed]

  def show
    #Find this user
    @user = User.find(params[:id])

    #Search
    @search = Sunspot.search(Item, Pairing) do
      without(:class, Item) if (params[:items] == "false")
      without(:class, Pairing) if (params[:pairings] == "false")

      with :user_id, params[:id]
      
      fulltext params[:search]
      order_by(:created_at, :desc)
      paginate per_page: 10, page: params[:page]
    end

    @feed = @search.results
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Fashion App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Account updated!"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def feed
    #Search
    @search = Sunspot.search(Item, Pairing) do
      #Item or Pairing filter
      without(:class, Item) if (params[:items] == "false")
      without(:class, Pairing) if (params[:pairings] == "false")

      #Followed users or self
      with(:user_id, current_user.followed_user_ids << current_user.id)

      #Tag and name search
      fulltext params[:search]

      #Sort order
      order_by(:created_at, :desc)

      #Pagination
      paginate per_page: 20, page: params[:page]
    end

    @feed = @search.results
  end

  private
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end
end
