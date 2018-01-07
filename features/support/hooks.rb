require_relative 'utils.rb'

Before do |feature|
  ## variable which loads the data file according to the environment
  CONFIG = YAML.load_file(File.dirname(__FILE__) + "/config/#{ENVIRONMENT_TYPE}.yml")
  ## configure the chosen browser
  Capybara.configure do |config|
    config.default_driver = :selenium
  end

  ##set base url
  # parsed_url = URI.parse(CONFIG['url'])
  # puts  parsed_url
  # http = Net::HTTP.new(parsed_url.host, parsed_url.port)
  # http.use_ssl = true

  Capybara.app_host = CONFIG['url']


  ## set default max wait and maximize browser
  Capybara.default_max_wait_time = 60
  unless BROWSER.eql?('poltergeist')
    # Capybara.current_session.driver.browser.manage.window.maximize
  end
end

After do |scenario|
  @util = Utils.new
  ## take screenshot if scenario fail
  if scenario.failed?
    @util.take_screenshot(scenario.name, 'screenshots/test_failed')
  end
  ## if the browser is different from poltergeist, kills instance
  unless BROWSER.eql?('poltergeist')
    Capybara.current_session.driver.quit
  end
end
