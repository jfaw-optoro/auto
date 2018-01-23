# encoding: utf-8
# !/usr/bin/env ruby
require 'fileutils'
require 'capybara'
require 'rspec'
class Utils
  include PageObjects

  def mouse_over(element_selector)
    element = Capybara.page.driver.browser.find_element(:css, element_selector)
    Capybara.page.driver.browser.mouse.move_to element
  end

  def take_screenshot(name_file, folder='screenshots/test_screens')
    timestamp =Time.now.strftime("%Y-%m-%d_%H-%M-%S")
    file = "#{folder}/#{name_file}#{timestamp}.png"
    puts "screenshot: " + file
    FileUtils.mkdir_p(folder) unless File.exists?(folder)
    if BROWSER.eql?('poltergeist')
      Capybara.page.save_screenshot(file)
    else
      Capybara.page.driver.browser.save_screenshot(file)
    end
  end

  def warehouse_admin_login(user, password)
    visit_page("MobileLogin::MobileLoginPage") do |page|
      page.username.set(user)
      page.password.set(password)
      page.submit.click
    end
    assert_on_page("Tools::ToolsPage")
  end

end
