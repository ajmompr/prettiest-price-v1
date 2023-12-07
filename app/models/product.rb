# == Schema Information
#
# Table name: products
#
#  id             :integer          not null, primary key
#  description    :string
#  image          :string
#  name           :string
#  product_volume :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Product < ApplicationRecord
  has_many  :listings, class_name: "Listing", foreign_key: "product_id", dependent: :destroy

  has_many :retailers, through: :listings, source: :retailer
end
