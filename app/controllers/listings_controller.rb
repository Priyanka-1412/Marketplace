class ListingsController < ApplicationController
  def index
    @listings = Listing.all
    #@categories = Category.all
  end

  def search
    #search request and lowecase the input
    @listings = Listing.where("LOWER(title) LIKE LOWER(?)", "%" + params[:q] + "%")
  end

  def show
    @listing = Listing.find params[:id]
    # Using open street map API
    @client = OpenStreetMap::Client.new
    #create an object
    @search = @client.search(q: "#{@listing.suburb}, #{@listing.postcode}",format: 'json', addressdetails: '1', accept_language: 'en')
    #extract value from JSON response
    @bounding_box = @search[0]["boundingbox"]
    @south_latitude = @bounding_box[0]
    @north_latitude = @bounding_box[1]
    @west_longitude = @bounding_box[2]
    @east_longitude = @bounding_box[3]
    #arrange longitude and latitude in bounding box as, bbox = min Longitude , min Latitude , max Longitude , max Latitude
    @bbox = @west_longitude + '%2C' + @south_latitude + '%2C' + @east_longitude + '%2C' + @north_latitude
    #extract value longitude and latitude values for marker
    @longitude = @search[0]["lon"]
    @latitude = @search[0]["lat"]
    @marker = @longitude + '%2C' + @latitude
  end

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.create listing_params #stong params
    if params[:listing][:images].present?
      params[:listing][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        listing.images << req["public_id"]
      end
    end
    @current_user.listings << listing
    redirect_to listing
  end

  def edit
    @listing = Listing.find params[:id]
  end


  def update
    listing = Listing.find params[:id]

    if params[:listing][:images].present?
      listing.images = []
      params[:listing][:images].each do |image|
        req = Cloudinary::Uploader.upload image
        listing.images << req["public_id"]
      end
      listing.update_attributes listing_params
      listing.save
    end
    redirect_to listing_path(@current_user.id) # show page
  end

  def destroy
    listing = Listing.find params[:id]
    listing.destroy
    redirect_to listings_path
  end

  private
  def listing_params
    params.require(:listing).permit(:title, :description, :category_id, :condition, :price, :phone, :availability, :images, :suburb, :postcode)
  end
end
