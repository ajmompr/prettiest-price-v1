desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  require "faker"

  if Rails.env.development?
    Retailer.destroy_all
    Product.destroy_all
  end

  p "Hello, 'Darkness', my old friend.."

  # Create Amazon Retailer
  retailer = Retailer.new
  retailer.image = "testurl.url"
  retailer.listing_count = 0
  retailer.name = "Amazon"
  retailer.url = "https://www.amazon.com/"
  retailer.save

  # Create Target Retailer
  retailer = Retailer.new
  retailer.image = "testurl.url"
  retailer.listing_count = 0
  retailer.name = "Target"
  retailer.url = "https://www.target.com/"
  retailer.save

  # Create Ulta Retailer
  retailer = Retailer.new
  retailer.image = "testurl.url"
  retailer.listing_count = 0
  retailer.name = "Ulta"
  retailer.url = "https://www.ulta.com/"
  retailer.save

  # Create Walmart Retailer
  retailer = Retailer.new
  retailer.image = "testurl.url"
  retailer.listing_count = 0
  retailer.name = "Walmart"
  retailer.url = "https://www.walmart.com/"
  retailer.save

  #Print retailer count
  p "Added #{Retailer.count} retailers to the database!"

  # Generate Products

  10.times do |count|
    product = Product.new
    product.description = Faker::Marketing.buzzwords
    product.image = "some_image.url"
    product.listings_count = 0
    product.name = Faker::Commerce.product_name
    product.product_volume = Faker::Number.decimal(l_digits: 2)
    product.save
  end

  #Print product count
  p "Added #{Product.count} products to the database!"
end
