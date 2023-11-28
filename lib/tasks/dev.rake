desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  require "faker"

  if Rails.env.development?
    Product.destroy_all
    Listing.destroy_all
    Snapshot.destroy_all
  end
  #Print retailer count
  p "Currently: #{Retailer.count} retailers in the database!"
  # Generate sample users
  names = ["bob", "alice", "sandra", "steve", "gerry", "jenny"]
  6.times do |count|
    user = User.new
    user.username = names.at(count)
    user.email = "#{user.username}@example.com"
    user.password = "password"
    user.save
  end
  p "Added #{User.count} users to the database!"

  # Generate sample products
  10.times do |count|
    product = Product.new
    product.description = Faker::TvShows::HeyArnold.quote
    product.image = "some_image.url"
    product.name = Faker::Commerce.product_name
    product.product_volume = Faker::Number.decimal(l_digits: 2)
    product.save
  end
  # Print product count
  p "Added #{Product.count} products to the database!"

  # Generate sample listing & retailer ids

  30.times do
    listing = Listing.new
    listing.url = "test_url.url"
    listing.product_id = Product.pluck(:id).sample
    listing.retailer_id = Retailer.pluck(:id).sample
    listing.save
  end
  p "You created #{Listing.count} listings!"

  # Generatae sample snapshots
  100.times do
    snapshot = Snapshot.new
    snapshot.faker_date = Faker::Date.between(from: "2023-10-23", to: "2023-11-27")
    snapshot.listing_id = Listing.pluck(:id).sample
    snapshot.price = Faker::Commerce.price
    snapshot.save
  end
  # Print number of listings
  p "You have added #{Snapshot.count} snapshots to the database!"

  # # Create Amazon Retailer
  # retailer = Retailer.new
  # retailer.image = "testurl.url"
  # retailer.listing_count = 0
  # retailer.name = "Amazon"
  # retailer.url = "https://www.amazon.com/"
  # retailer.save

  # # Create Target Retailer
  # retailer = Retailer.new
  # retailer.image = "testurl.url"
  # retailer.listing_count = 0
  # retailer.name = "Target"
  # retailer.url = "https://www.target.com/"
  # retailer.save

  # # Create Ulta Retailer
  # retailer = Retailer.new
  # retailer.image = "testurl.url"
  # retailer.listing_count = 0
  # retailer.name = "Ulta"
  # retailer.url = "https://www.ulta.com/"
  # retailer.save

  # # Create Walmart Retailer
  # retailer = Retailer.new
  # retailer.image = "testurl.url"
  # retailer.listing_count = 0
  # retailer.name = "Walmart"
  # retailer.url = "https://www.walmart.com/"
  # retailer.save
end
