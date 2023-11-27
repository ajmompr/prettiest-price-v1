class AddImageToRetailers < ActiveRecord::Migration[7.0]
  def change
    add_column :retailers, :image, :string
  end
end
