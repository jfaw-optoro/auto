require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'
require 'yaml'
require 'capybara/poltergeist'

BROWSER = ENV['BROWSER'] || 'chrome'
ENVIRONMENT_TYPE = ENV['ENVIRONMENT_TYPE'] || 'staging'

Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('chrome')
        Selenium::WebDriver::Chrome.driver_path = "/Users/loaner_user/rubimine/auto/features/support/chromedriver"
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
    elsif BROWSER.eql?('poltergeist')
        options = { js_errors: false }
        Capybara::Poltergeist::Driver.new(app, options)
    end
end

require_relative "helpers"
World(PageObjects)

