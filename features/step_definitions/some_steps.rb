require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

When /^I navigate to the login page$/ do
  @login1 = PageObjects::Login::LoginPage
  # @login = visit_page("Login::LoginPage")
  binding.pry
end