class AddImagesToListings < ActiveRecord::Migration[5.2]
  def change
    add_column :listings, :images, :text, :array => true, :default => []
  end
end
