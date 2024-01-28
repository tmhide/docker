require 'selenium-webdriver'

module LambdaFunction
  class Handler
    # ruby -r ./app.rb -e 'LambdaFunction::Handler.process'
    def self.local
      process(event: nil,context: nil)
    end
    def self.process(event:,context:)
      p "Hello from Ruby 2.7 container image!"
      p event

      Selenium::WebDriver::Chrome::Service.driver_path = "/usr/local/chromedriver"
      options = Selenium::WebDriver::Options.chrome(args: [
        '--headless=new',
        '--no-sandbox',
        '--homedir=/tmp',
        '--user-data-dir=/tmp/selenium-test'
      ])
      options.binary = "/usr/local/chrome"
      
      web_driver = Selenium::WebDriver.for :chrome, options: options
      web_driver.navigate.to "https://google.com/"
      web_driver.quit
    end
  end
end