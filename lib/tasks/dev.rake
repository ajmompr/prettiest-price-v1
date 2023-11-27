desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  p "Hello, 'Darkness', my old friend.."

  # Create Amazon Retailer
  retailer = Retailer.new
  retailer.image = "testurl.url"
  retailer.listing_count = 0
  retailer.name = "Amazon"
  retailer.url = "https://www.amazon.com/"
  retailer.save

  
end
