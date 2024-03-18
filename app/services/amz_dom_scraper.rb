require 'open-uri'
require 'nokogiri'
require 'selenium-webdriver'


class AmzDomScraper
  BASE_URL = "https://camelcamelcamel.com/product"

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

    # Parse Product Price & Date Snapshot information from CamelCamelCamel
    third_column_data = doc.css('table tr:first-child td:nth-child(4)').text
    third_column_array = third_column_data.split("\n")

    # Fetch Prodcut Snapshot Price
    snapshot_price_string = third_column_array[1]
    snapshot_price_float = snapshot_price_string.gsub("$","").to_f

    # Fetch Product Snapshot Date
    snapshot_date_string = third_column_array[2]
    snapshot_date_stripped = snapshot_date_string.gsub("(","").gsub(")","")
    snapshot_date = Date.parse(snapshot_date_stripped)
    debugger

    puts "Product: #{listing_id}; Daily Snapshot Price: $#{snapshot_price_float}; Daily Snaphsot Date: #{snapshot_date}"

  rescue StandardError => e
    puts "Error: #{e}"
  end

  private

  def listing_path
    "/#{@listing_id}"
  end

  def fetch_html(url)
    user_agent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Safari/537.36"
    
    options = Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--headless=new')
    options.add_argument("--user-agent=#{user_agent}")
    
    # driver = Selenium::WebDriver.for(:chrome)
    
    driver = Selenium::WebDriver.for(:chrome, capabilities: [options])

    driver.navigate.to url
    wait = Selenium::WebDriver::Wait.new(timeout: 30)
    wait.until { driver.find_element(class: "price") }
    html = driver.page_source
    driver.quit

    html
  rescue Selenium::WebDriver::Error::TimeoutError
    nil
  end
  
end
