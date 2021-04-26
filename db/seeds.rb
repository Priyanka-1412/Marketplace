User.destroy_all
user1 = User.create :email => 'pri@ga.com', :password => 'chicken', :admin => true
user2 = User.create :email => 'ma@ga.com', :password => 'chicken'
user3 = User.create :email => 'jo@ga.com', :password => 'chicken'
puts "#{User.count} users"

Listing.destroy_all
l1 = Listing.create :title =>'TV cabinet'
l2 = Listing.create :title =>'Chair'
l3 = Listing.create :title =>'Dress'
l4 = Listing.create :title =>'watch'
puts "#{Listing.count} listings"

Category.destroy_all
c1 = Category.create :name => 'Clothings and Accessories'
c2 = Category.create :name => 'Furniture'
c3 = Category.create :name => 'Appliances'
c4 = Category.create :name => 'Entertainmnet'
c5 = Category.create :name => 'Electronics'
c6 = Category.create :name => 'Vehicles'
c7 = Category.create :name => 'Family'
puts "#{Category.count} category"
######Associations#############
puts "users and listings"
user1.listings << l1 << l4
user2.listings << l2
user3.listings << l3

puts "listings and categories"
c2.listings << l1 << l2
c1.listings << l3 << l4
