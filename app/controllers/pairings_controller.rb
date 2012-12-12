class PairingsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy, :index]

  def index
    @user = User.find(params[:user_id])
    @pairings = @user.pairings.paginate(page: params[:page])

    #Form for adding is in same page
    if signed_in?
      @pairing = @user.pairings.build
    end
  end

  def create
    @pairing = current_user.pairings.build(params[:pairing])

    if @pairing.save
      flash[:success] = "Added new Pairing!"
      redirect_to user_pairings_path(current_user)
    else
      flash[:error] = "We were unable to add your latest pairing. Please try again later."
      redirect_to user_pairings_path(current_user)
    end
  end

  def destroy
  end
end
