namespace :scrape do
  desc "Runs price scraper"
  task prices: :environment do
    p "Scraping prices...."
    # TODO: loop through listings
    AmzDomScraper.new('B000YJ2SLG').scrape
    p "Done"
  end
end
