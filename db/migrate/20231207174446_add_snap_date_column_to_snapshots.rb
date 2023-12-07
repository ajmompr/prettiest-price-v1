class AddSnapDateColumnToSnapshots < ActiveRecord::Migration[7.0]
  def change
    add_column :snapshots, :snapshot_date, :date
  end
end
