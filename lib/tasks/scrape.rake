namespace :scrape do
  desc "Runs price scraper"
  task prices: :environment do
    p "Scraping prices...."
    # TODO: loop through listings
    AmazonPriceScraper.new('B00TTD9BRC').scrape
    p "Done"
  end
end

# task({ :test_scrape => :environment }) do
#   options = Selenium::WebDriver::Chrome::Options.new
#   options.add_argument('--ignore-certificate-errors')
#   options.add_argument('--disable-popup-blocking')
#   options.add_argument('--disable-notification')
#   options.add_argument('--disable-translate')
#   options.add_argument('--headless=new') # try without
#   driver = Selenium::WebDriver.for :chrome, options: options
#   driver.navigate.to 'https://quotes.toscrape.com/js/'
#   quotes = driver.find_elements(class: 'quote')
#   quotes.each {|q|
#     #pp q.text
#     #pp q.attr("class")
#     quote_text = q.find_element(class: 'text').text
#     author =  q.find_element(class: 'author').text
#     puts "#{author}: #{quote_text}"
#     #debugger
#   }
# end
