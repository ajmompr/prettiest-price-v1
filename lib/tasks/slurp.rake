namespace :slurp do
  desc "Import snapshot price data from CSV"
  task amz_snapshots: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "amazon_snapshots.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      puts row.to_hash
    end
  end
end
