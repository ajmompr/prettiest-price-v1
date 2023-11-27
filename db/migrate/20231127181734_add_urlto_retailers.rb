class AddUrltoRetailers < ActiveRecord::Migration[7.0]
  def change
    add_column :retailers, :url, :string
  end
end
