require 'selenium-webdriver'

require './cyber_dojo_main_page'

class CyberDojoBrowser

  def initialize
    @driver = Selenium::WebDriver.for :chrome if ENV['browser'] == 'chrome'
    @driver = Selenium::WebDriver.for :firefox if ENV['browser'] == 'firefox'
    @wait = Selenium::WebDriver::Wait.new(:timeout => 4)

    @mainPage = CyberDojoMainPage.new(@driver, @wait)

    @driver.manage.window.resize_to 1920, 1080
  end

  def close
    @driver.quit
  end

  def navigate_home
    @driver.navigate.to "http://cyber-dojo.org"
  end

  def title
    @driver.title
  end

  def save_screenshot(filename)
    @driver.save_screenshot(filename + ".png")
  end

  def page
    url = @driver.current_url

    match = /http\:\/\/cyber-dojo\.org\/(.*)\/(.*)/.match(url)

    if match != nil
      case match[1]
        when "setup_default_start_point"
          return 1
        else
          return 2
      end
    elsif url == "http://cyber-dojo.org/"
      return @mainPage
    end
    url
  end

end