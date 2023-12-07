namespace :slurp do
  desc "Import snapshot price data from CSV"
  task amz_snapshots: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "amazon_snapshots.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      t = Snapshot.new
      t.price = row["price"]
      t.snapshot_date = row["date"]
      t.listing_id = row["listing_id"]
      t.save
      puts "The price snapshot: $#{t.price} on date: #{t.snapshot_date} was saved."
    end
    
    puts "There are now #{Snapshot.count} rows in the snapshot table."
  end
end
