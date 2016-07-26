class ListingsController < ApplicationController

  before_action :require_login, only: [:destroy, :edit, :update, :new, :create]

  before_action :set_listing, only: [:edit, :update, :destroy, :show]

  def new
    @listing = Listing.new

  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to @listing # go to /listings/:id ,show page
    else
      render :new #render new.html.erb
    end  

  end

  def edit
  end

  def update
    
    set_listing.update(listing_params)
    redirect_to listing_path(@listing.id)
  end

  def destroy 

    @listing.destroy    
    redirect_to mylistings_path(current_user)
  end

  def index
  end

  def show
    if current_user.id == @listing.user_id.to_i    
          @edit_permission = true
    end  
  end

 

  private
  def set_listing
    
    @listing = Listing.find(params[:id])

  end 

  def listing_params
    permitted = params.require(:listing).permit(:titles, :descriptions, :locations, :prices, {avatars:[]})
  end 
end
