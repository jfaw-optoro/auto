require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'

#use chrome as default driver, later add multiple options --> cucumber.yml
Selenium::WebDriver::Chrome.driver_path="./drivers/chromedriver"
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')
driver = Selenium::WebDriver.for :chrome, options: options

url = "http://snowflake-005.stage.optiturn.com"
#later edit url = "https://#{ENV['WHERE_TO_RUN']}/"  cucumber WHERE_TO_RUN=snowflake-005.stage.optiturn.com


Before do |scenario|
    # prepare db
    driver.get("http://snowflake-005.stage.optiturn.com")
    binding.pry
end

After do |scenario|
    driver.quit
    # add screenshot for failed scenario + logging error
end


#initialize PageObjects
require_relative "helpers"
World(PageObjects)

