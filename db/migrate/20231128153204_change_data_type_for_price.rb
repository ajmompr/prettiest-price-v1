class ChangeDataTypeForPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :snapshots, :price, :float
  end
end
