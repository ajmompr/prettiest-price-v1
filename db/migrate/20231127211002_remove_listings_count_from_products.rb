class RemoveListingsCountFromProducts < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :listings_count
  end
end
