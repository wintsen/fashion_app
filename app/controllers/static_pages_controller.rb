class StaticPagesController < ApplicationController
  require 'will_paginate/array'
  def home
    #TODO: New items are added all the time, how to scroll down without repeat
    #TODO: Paginate uses offset, optimize for that case. Now need to come into memory

    @items = Array.new
    @pairings = Array.new

    if(params[:items] != "false")
      @items = Item.all
    end

    if(params[:pairings] != "false")
      @pairings = Pairing.all
    end

    @feed = (@pairings+@items).sort_by(&:created_at).reverse!.paginate(page: params[:page], per_page: 40)

    # @feed = (Pairing.all + Item.all).sort_by(&:created_at).reverse!.paginate(page: params[:page], per_page: 40)
    # @feed = Item.all.sort_by(&:created_at).reverse!.paginate(page: params[:page], per_page: 20)
    # @feed = (pairings + items)
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
