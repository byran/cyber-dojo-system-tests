require 'selenium-webdriver'

require './cyber_dojo_main_page'
require '../tests/cyber_dojo_setup_default_start_point_page'

class CyberDojoBrowser

  def initialize
    @driver = Selenium::WebDriver.for :firefox if ENV['browser'] == 'firefox'
    @driver = Selenium::WebDriver.for :chrome if ENV['browser'] == 'chrome' || @driver == nil
    @wait = Selenium::WebDriver::Wait.new(:timeout => 4)

    @mainPage = CyberDojoMainPage.new(@driver, @wait)
    @setupDefaultStartPointPage = CyberDojoSetupDefaultStartPointPage.new(@driver, @wait)

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

  def page_url
    url = @driver.current_url
    url.slice! "http://cyber-dojo.org/"

    splitUrl = url.split("/")
    splitUrl.first
  end

  def home_page
    @wait.until { page_url == nil }
    @mainPage
  end

  def setup_default_start_point_page
    @wait.until { page_url == "setup_default_start_point" }
    @setupDefaultStartPointPage
  end

end