namespace :slurp do
  desc "Import snapshot price data from CSV"
  task snapshots: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "amazon_snapshots.csv"))
    puts csv_text
  end

end
