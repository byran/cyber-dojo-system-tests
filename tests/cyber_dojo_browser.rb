require 'selenium-webdriver'

require './cyber_dojo_main_page'
require './cyber_dojo_setup_default_start_point_show_languages_page'
require './cyber_dojo_setup_default_start_point_show_exercises_page'

class CyberDojoBrowser

  def initialize
#    @driver = Selenium::WebDriver.for :firefox if ENV['browser'] == 'firefox'
#    @driver = Selenium::WebDriver.for :chrome if ENV['browser'] == 'chrome' || @driver == nil
    @driver = Selenium::WebDriver.for :remote, :url => "http://192.168.1.129:4444/wd/hub", :desired_capabilities => :firefox
    @wait = Selenium::WebDriver::Wait.new(:timeout => 4)

    @mainPage = CyberDojoMainPage.new(@driver, @wait)
    @setupDefaultStartPointPageShowLanugages = CyberDojoSetupDefaultStartPointShowLanguagesPage.new(@driver, @wait)
    @setupDefaultStartPointPageShowExercises = CyberDojoSetupDefaultStartPointShowExercisesPage.new(@driver, @wait)

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
    # Not keen on this sleep but Firefox will take a screen shot before completing
    # the previous action if it's not present.
    # TODO: Find a better way to complete actions before taking a screen shot
    sleep 1
    @driver.save_screenshot(filename + ".png")
  end

  def page_url
    url = @driver.current_url
    url.slice! "http://cyber-dojo.org/"

    url.split("/")
  end

  def home_page
    @wait.until { page_url == [] }
    @mainPage
  end

  def setup_default_start_point_show_languages_page
    @wait.until { page_url[0] == "setup_default_start_point" && page_url[1] == "show_languages" }
    @setupDefaultStartPointPageShowLanugages
  end

  def setup_default_start_point_show_exercises_page
    @wait.until { page_url[0] == "setup_default_start_point" && page_url[1] == "show_exercises" }
    @setupDefaultStartPointPageShowExercises
  end

end