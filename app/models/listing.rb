class Listing < ApplicationRecord
belongs_to :user, :optional => true
belongs_to :location, :optional => true
belongs_to :category, :optional => true
end
