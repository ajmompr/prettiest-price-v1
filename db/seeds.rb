# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create admin user
require "securerandom"
random_string = SecureRandom.hex(8)
robohash_url = 'https://robohash.org/#{random_string}.png?set=set4'
admin_password = ENV["TPP_ADMIN"]
User.create(admin: true, avatar: robohash_url, email: "amomprem@uillinois.edu", password: admin_password, username: "amomprem")

# Create MVP Product Here
Product.create(description: "CeraVe Moisturizing Cream is a rich, non-greasy, fast-absorbing moisturizer for normal to dry skin on the face and body.", image: "app/assets/images/cerave_bodycream_16_oz.png", name: "CeraVe Moisturizing Cream", product_volume: 16)

# Create Image Paths for retailer logos
amz_img_path = File.join(Rails.root, "app", "assets", "images", "amazon_logo.png")
target_img_path = File.join(Rails.root, "app", "assets", "images", "target_logo.png")
ulta_img_path = File.join(Rails.root, "app", "assets", "images", "ulta_logo.png")
walmart_img_path = File.join(Rails.root, "app", "assets", "images", "walmart_logo.png")

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
