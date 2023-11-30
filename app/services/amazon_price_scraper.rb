require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'

class AmazonPriceScraper
  BASE_URL = "https://www.amazon.com/"

  attr_accessor :listing_id

  def initialize(listing_id)
    @listing_id = listing_id
  end

  def scrape
    # html = URI.open(BASE_URL + listing_path)
    url = BASE_URL + listing_path
    html = fetch_html(url)
    if html.nil?
      puts "nothing found at this url: #{url}"

      return
    end
 
    doc = Nokogiri::HTML(html)

    # Locate the price element using the CSS selector
    price_element = doc.at_css('.a-price.aok-align-center.reinventPricePriceToPayMargin.priceToPay')
    # Extract the price text if the element exists
    if price_element
      price = price_element.text.strip
      puts "The price of the product is: #{price}"
    else
      puts 'Price information not found.'
    end
  rescue StandardError => e
    puts "Error: #{e}"
  end

  private

  def listing_path
    "dp/#{@listing_id}"
  end

 task({ :scrape_parse_dynamic => :environment }) do
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--ignore-certificate-errors')
  options.add_argument('--disable-popup-blocking')
  options.add_argument('--disable-notification')
  options.add_argument('--disable-translate')
  options.add_argument('--headless=new') # try without
  driver = Selenium::WebDriver.for :chrome, options: options
  driver.navigate.to 'https://quotes.toscrape.com/js/'
  quotes = driver.find_elements(class: 'quote')
  quotes.each {|q|
    #pp q.text
    #pp q.attr("class")
    quote_text = q.find_element(class: 'text').text
    author =  q.find_element(class: 'author').text
    puts "#{author}: #{quote_text}"
    #debugger
  }
end

  def fetch_html(url)
    driver = Selenium::WebDriver.for(:chrome)

    options = Selenium::WebDriver::Chrome::Options.new
    options.headless!
    driver = Selenium::WebDriver.for(:chrome, capabilities: [options])

    driver.navigate.to url
    wait = Selenium::WebDriver::Wait.new(timeout: 10)
    wait.until { driver.find_element(class: "a-price.aok-align-center.reinventPricePriceToPayMargin.priceToPay") }
    html = driver.page_source
    driver.quit

    html
  rescue Selenium::WebDriver::Error::TimeoutError
    nil
  end
  
end
