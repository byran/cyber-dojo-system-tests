require 'selenium-webdriver'

require File.join(File.expand_path(File.dirname(__FILE__)), "main_page.rb")
require File.join(File.expand_path(File.dirname(__FILE__)), "setup_default_start_point_show_languages_page.rb")
require File.join(File.expand_path(File.dirname(__FILE__)), "setup_default_start_point_show_exercises_page.rb")

class CyberDojoBrowser

  def initialize
    hubUrl = ENV['hub']
    hubUrl = "http://hub:4444/wd/hub" if hubUrl.nil?

    if ENV['browser'] == 'firefox'
      @driver = Selenium::WebDriver.for :remote, :url => hubUrl, :desired_capabilities => :firefox

    end
    if ENV['browser'] == 'chrome' || @driver == nil
      @driver = Selenium::WebDriver.for :remote, :url => hubUrl, :desired_capabilities => :chrome
    end

    @wait = Selenium::WebDriver::Wait.new(:timeout => 4)

    @mainPage = CyberDojoMainPage.new(@driver, @wait)
    @setupDefaultStartPointPageShowLanugages = CyberDojoSetupDefaultStartPointShowLanguagesPage.new(@driver, @wait)
    @setupDefaultStartPointPageShowExercises = CyberDojoSetupDefaultStartPointShowExercisesPage.new(@driver, @wait)

    @driver.manage.window.resize_to 1920, 1080

    @baseURL = "http://nginx/"
  end

  def close
    @driver.quit
  end

  def navigate_home
    @driver.navigate.to @baseURL
  end

  def title
    @driver.title
  end

  def save_screenshot(filename)
    # Not keen on this sleep but Firefox will take a screen shot before completing
    # the previous action if it's not present.
    # TODO: Find a better way to complete actions before taking a screen shot
    sleep 1
    @driver.save_screenshot("images/" + filename + ".png")
  end

  def page_url
    url = @driver.current_url
    url.slice! @baseURL

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