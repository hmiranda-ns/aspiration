require 'capybara/cucumber'
require 'capybara/dsl'
require 'pry'
require 'require_all'
require 'selenium-webdriver'
require 'webdrivers'

Capybara.run_server = false
Capybara.app_host = "https://www.aspiration.com/"
Capybara.default_driver = :headless_chrome


Capybara.register_driver :chrome do |app|
  args = ['--disable-infobars',
          '--disable-notifications',
          '--window-size=1920,1080',
          '--incognito']
  prefs = {
    'credentials_enable_service' => false,
    'profile.password_manager_enabled' => false
  }

  options = Selenium::WebDriver::Chrome::Options.new(args: args, prefs: prefs)
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.register_driver :headless_chrome do |app|
  args = ['--disable-infobars',
          '--disable-notifications',
          '--window-size=1920,1080',
          '--incognito',
          '--headless',
          '--no-sandbox',
          '--disable-dev-shm-usage',
          '--disable-gpu']
  prefs = {
    'credentials_enable_service' => false,
    'profile.password_manager_enabled' => false
  }

  options = Selenium::WebDriver::Chrome::Options.new(args: args, prefs: prefs)
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

## CUSTOM SELECTOR
Capybara.add_selector(:data_id) do
  css { |v| "*[data-id=#{v}]" }
end

def find_by_data_id(value)
  find(:data_id, value)
end
