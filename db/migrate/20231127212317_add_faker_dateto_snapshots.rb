class AddFakerDatetoSnapshots < ActiveRecord::Migration[7.0]
  def change
    add_column :snapshots, :faker_date, :date
  end
end
