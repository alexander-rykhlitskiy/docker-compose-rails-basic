# ...

if ENV['LIVE_CHROME']
  Capybara.javascript_driver = :selenium_chrome
else
  Capybara.register_driver :chrome do |app|
    options = ::Selenium::WebDriver::Chrome::Options.new

    # https://stackoverflow.com/questions/50610316/capybara-headless-chrome-in-docker-returns-devtoolsactiveport-file-doesnt-exist
    options.add_argument('--headless')
    options.add_argument('--no-sandbox')
    options.add_argument('--disable-gpu')
    options.add_argument('--disable-dev-shm-usage')
    options.add_argument('--window-size=1400,1400')
    options.add_argument('--takesScreenshot=true')

    Capybara::Selenium::Driver.new(app, url: 'http://chrome:4444', browser: :chrome, options: options)
  end

  Capybara.server_host = '0.0.0.0'
  Capybara.server_port = 33_333
  Capybara.app_host = "http://website:#{Capybara.server_port}"

  Capybara.javascript_driver = :chrome
end

# ...
