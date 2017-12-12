require "selenium-webdriver"

#driver = Selenium::WebDriver.for :firefox

Selenium::WebDriver::Chrome.driver_path="./drivers/chromedriver"
options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--ignore-certificate-errors')
options.add_argument('--disable-popup-blocking')
options.add_argument('--disable-translate')
driver = Selenium::WebDriver.for :chrome, options: options
driver.navigate.to "https://www.google.com"

element = driver.find_element(name: 'q')
element.send_keys "Hello WebDriver!"
element.submit

puts driver.title

driver.quit