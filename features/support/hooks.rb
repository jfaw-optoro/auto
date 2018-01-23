require_relative 'utils.rb'
require 'pry'
Before do |feature|
  ## variable which loads the data file according to the environment
  CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")
  ## configure the chosen browser
  Capybara.configure do |config|
    config.default_driver = :selenium
  end

  Capybara.app_host = CONFIG['url']
  ## set default max wait and maximize browser
  Capybara.default_max_wait_time = 60

  @util = Utils.new
  user = CONFIG['warehouse_admin_user']
  pass = CONFIG['warehouse_admin_password']
  @util.warehouse_admin_login(user, pass)
end

After do |scenario|
  @util = Utils.new
  ## take screenshot if scenario fail
  if scenario.failed?
    @util.take_screenshot(scenario.name, 'screenshots/test_failed')
  end
  ## if the browser is different from poltergeist, kills instance
  unless BROWSER.eql?('chromeheadless')
    Capybara.current_session.driver.quit
  end
end
