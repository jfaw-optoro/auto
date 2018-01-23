require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'

BROWSER = ENV['BROWSER'] || 'chrome'
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE'] || 'staging'

Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('chrome')
        Selenium::WebDriver::Chrome.driver_path = "features/support/chromedriver"
        Capybara::Selenium::Driver.new(app,
                                       :browser => :chrome,
                                       :desired_capabilities => Selenium::WebDriver::Remote::Capabilities.chrome(
                                           'chromeOptions' => {
                                               'args' => [ "--start-maximized" ]
                                           }
                                       )
        )
    elsif BROWSER.eql?('firefox')
        Capybara::Selenium::Driver.new(app, :browser => :firefox)
    elsif BROWSER.eql?('internet_explorer')
        Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
    elsif BROWSER.eql?('safari')
        Capybara::Selenium::Driver.new(app, :browser => :safari)
    end
end

require_relative 'helpers'
World(PageObjects)
