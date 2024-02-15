# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  user_id    :integer
#
class Favorite < ApplicationRecord
  belongs_to :product, class_name: "Product", foreign_key: "product_id"
  belongs_to :user, class_name: "User", foreign_key: "user_id"
end
