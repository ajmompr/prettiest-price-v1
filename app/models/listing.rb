# == Schema Information
#
# Table name: listings
#
#  id          :integer          not null, primary key
#  url         :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  product_id  :integer
#  retailer_id :integer
#
class Listing < ApplicationRecord
  belongs_to :product, required: true, class_name: "Product", foreign_key: "product_id"
  belongs_to :retailer, required: true, class_name: "Retailer", foreign_key: "retailer_id"
  has_many  :snapshots, class_name: "Snapshot", foreign_key: "listing_id", dependent: :destroy

  # def fetch_snapshot
    # TODO: add listing_id
    # something like this 
    # if retailer.name == "amazon"
      # price = AmazonPriceScraper.new(retailer_id).scrape
    # elsif retailer.name = "walmart"
      # TODO: walmart, etc....
    # end
  # end

  # def self.fetch_snapshots
  #   Listing.all.each do |listing|
  #     listing.fetch_snapshot
  #   end
  # end
end
