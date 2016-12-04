require 'selenium-webdriver'

require File.join(File.expand_path(File.dirname(__FILE__)), "pages.rb")
require File.join(File.expand_path(File.dirname(__FILE__)), "wait_mixin.rb")

module CyberDojo
  class Browser

    attr_reader :wait
    attr_reader :pages

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
      @wait.extend(WaitMixIn)

      @pages = Pages.new(@driver, @wait)

      @driver.manage.window.resize_to 1920, 1080
      @driver.manage.timeouts.implicit_wait = 20
      @driver.manage.timeouts.page_load = 10

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

    def switch_to_window(index)
      @driver.switch_to.window(@driver.window_handles[index])
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

    def page
      currentUrl = page_url

      @pages.all_pages.each do |p|
        return p[:page] if p[:url] == currentUrl
        return p[:page] if (p[:url] & currentUrl == p[:url]) && (p[:url] != [])
      end

      nil
    end
  end
end
