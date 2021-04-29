class ChangeAvailabilityToBeTextInListings < ActiveRecord::Migration[5.2]
  def change
    change_column :listings, :availability, :text
  end
end
