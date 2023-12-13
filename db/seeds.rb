# Create admin user
require "securerandom"
random_string = SecureRandom.hex(8)
robohash_url = 'https://robohash.org/#{random_string}.png?set=set4'
admin_password = ENV["TPP_ADMIN"]
User.create(admin: true, avatar: robohash_url, email: "amomprem@uillinois.edu", password: admin_password, username: "amomprem")

# Create MVP Product Here
Product.create(brand: "CeraVe", category: "Personal Care", description: "CeraVe Moisturizing Cream is a rich, non-greasy, fast-absorbing moisturizer for normal to dry skin on the face and body.", image: "https://www.cerave.com/-/media/project/loreal/brand-sites/cerave/americas/us/products-v4/moisturizing-cream/cerave_moisturizing_cream_16oz_jar_front-700x875-v3.jpg?rev=db6e3c22250e4928bc749dd2c207de5b&w=500&hash=6F959AC16DA324FFB9DCE0C5BFDC8AD5", name: "CeraVe Moisturizing Cream", product_volume: 16)

# Create Image Paths for retailer logos
amz_img_path = "https://upload.wikimedia.org/wikipedia/commons/a/a9/Amazon_logo.svg"
target_img_path = "https://upload.wikimedia.org/wikipedia/commons/9/9a/Target_logo.svg"
ulta_img_path = "https://upload.wikimedia.org/wikipedia/commons/9/9e/Ulta_Beauty_logo.svg"
walmart_img_path = "https://upload.wikimedia.org/wikipedia/commons/c/ca/Walmart_logo.svg"

# # Add amazon retailer
Retailer.create(image: amz_img_path, name: "Amazon", url: "https://www.amazon.com/")

# Create Target Retailer
Retailer.create( image: target_img_path, name: 'Target', url: 'https://www.target.com/')

# Create Ulta Retailer
Retailer.create( image: ulta_img_path, name: 'Ulta', url: 'https://www.ulta.com/')

# Create Walmart Retailer
Retailer.create( image: walmart_img_path, name: 'Walmart', url: 'https://www.walmart.com/')

# Add Listing seed data
Listing.create(url: "https://www.amazon.com/dp/B00TTD9BRC?tag=camelweb-20&linkCode=ogi&th=1&psc=1&language=en_US", product_id: 1, retailer_id: 1)
Listing.create(url: "https://www.target.com/p/cerave-moisturizing-cream-unscented-16-fl-oz/-/A-13977967#lnk=sametab", product_id: 1, retailer_id: 2)
Listing.create(url: "https://www.ulta.com/p/moisturizing-cream-with-hyaluronic-acid-balanced-dry-skin-xlsImpprod3530069", product_id: 1, retailer_id: 3)
Listing.create(url: "https://www.walmart.com/ip/CeraVe-Moisturizing-Cream-Jar-for-Face-and-Body-for-Normal-to-Dry-Skin-16oz/681955595?athbdg=L1103&from=/search", product_id: 1, retailer_id: 4)

# Add Amazon Snapshot seed data
require "csv"

csv_text = File.read(Rails.root.join("lib", "csvs", "amazon_snapshots.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  t = Snapshot.new
  t.price = row["price"]
  t.snapshot_date = row["date"]
  t.listing_id = row["listing_id"]
  t.save
end

# Add Target Snapshot Seed data
csv_text = File.read(Rails.root.join("lib", "csvs", "target_snapshots.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  t = Snapshot.new
  t.price = row["price"]
  t.snapshot_date = row["date"]
  t.listing_id = row["listing_id"]
  t.save
end

# Add Ulta Snapshot seed data
csv_text = File.read(Rails.root.join("lib", "csvs", "ulta_snapshots.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  t = Snapshot.new
  t.price = row["price"]
  t.snapshot_date = row["date"]
  t.listing_id = row["listing_id"]
  t.save
end

# Add Walmart Snapshot Seed data
csv_text = File.read(Rails.root.join("lib", "csvs", "walmart_snapshots.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  t = Snapshot.new
  t.price = row["price"]
  t.snapshot_date = row["date"]
  t.listing_id = row["listing_id"]
  t.save
end
