namespace :scrape do
  desc "Runs price scraper"
  task prices: :environment do
    p "Scraping prices...."
    # TODO: loop through listings
    AmzDomScraper.new('B00TTD9BRC').scrape
    p "Done"
  end
end
