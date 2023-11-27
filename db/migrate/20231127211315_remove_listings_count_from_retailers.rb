class RemoveListingsCountFromRetailers < ActiveRecord::Migration[7.0]
  def change
    remove_column :retailers, :listing_count
  end
end
