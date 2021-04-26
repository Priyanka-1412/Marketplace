class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.integer :user_id
      t.text :title
      t.text :description
      t.text :category
      t.text :image
      t.integer :location_id
      t.integer :category_id
      t.text :condition
      t.text :suburb
      t.integer :postcode
      t.string :phone
      t.float :price
      t.boolean :availability
      t.timestamps
    end
  end
end
