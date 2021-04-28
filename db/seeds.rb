User.destroy_all
user1 = User.create :email => 'pri@ga.com', :password => 'chicken', :admin => true
user2 = User.create :email => 'ma@ga.com', :password => 'chicken'
user3 = User.create :email => 'jo@ga.com', :password => 'chicken'
puts "#{User.count} users"

Listing.destroy_all
l1 = Listing.create :title =>'TV cabinet',:suburb=> 'Marsden Park' ,:postcode => 2765
l2 = Listing.create :title =>'Chair', :suburb=> 'Westmead' ,:postcode => 2145
l3 = Listing.create :title =>'Dress', :suburb=> 'Blacktown' ,:postcode => 2148
l4 = Listing.create :title =>'watch', :suburb=> 'Marsden Park' ,:postcode => 2765
puts "#{Listing.count} listings"

Category.destroy_all
c1 = Category.create :name => 'Clothings'
c2 = Category.create :name => 'Accessories'
c3 = Category.create :name => 'Furniture'
c4 = Category.create :name => 'Appliances'
c5 = Category.create :name => 'Entertainmnet'
c6 = Category.create :name => 'Electronics'
c7 = Category.create :name => 'Vehicles'
c8 = Category.create :name => 'Family'
c9 = Category.create :name => 'Toys'
c10 = Category.create :name => 'Other'
puts "#{Category.count} category"

Location.destroy_all
location1 = Location.create :suburb => 'Blacktown', :postcode => 2148
location2 = Location.create :suburb => 'Westmead', :postcode => 2145
location3 = Location.create :suburb => 'Sydney', :postcode => 2000
location4 = Location.create :suburb => 'Marsden Park', :postcode => 2765
location5 = Location.create :suburb => 'Ashfield', :postcode => 2131
location6 = Location.create :suburb => 'Parramatta', :postcode => 2150
location7 = Location.create :suburb => 'Chatswood', :postcode =>2067
location8 = Location.create :suburb => 'Epping', :postcode => 2121
location9 = Location.create :suburb => 'Redfern', :postcode => 2016
location10 = Location.create :suburb => 'Alexandria', :postcode => 2015
location11 = Location.create :suburb => 'Coogee', :postcode => 2034
######Associations#############
puts "users and listings"
user1.listings << l1 << l4
user2.listings << l2
user3.listings << l3

puts "listings and categories"
c2.listings << l1 << l2
c1.listings << l3 << l4
