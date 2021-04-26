class ListingsController < ApplicationController
  def index
    @listings = Listing.all
  end

  def search
    #search request and lowecase the input
    @listings =Listing.where("LOWER(title) LIKE LOWER(?)", "%" + params[:q] + "%")
  end

  def show
    @listing = Listing.find params[:id]
  end

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.create listing_params #stong params
    redirect_to listing
  end

  def edit
    @listing = Listing.find params[:id]
  end


  def update
    listing = Listing.find params[:id]
    listing.update listing_params
    redirect_to listing_path(@current_user.id) # show page
  end

  def destroy
    listing = Listing.find params[:id]
    listing.destroy
    redirect_to listings_path
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :category_id, :condition, :price, :phone, :availability, :image, :suburb, :postcode)
  end
end
