require 'selenium-webdriver'

require_relative './pages.rb'
require_relative './wait_mixin.rb'

module CyberDojo

  class Browser

    attr_reader :wait
    attr_reader :pages
    attr_reader :base_URL

    def initialize
      hub_url = ENV['hub']
      hub_url = 'http://hub:4444/wd/hub' if hub_url.nil?

      if ENV['browser'] == 'firefox'
        @driver = Selenium::WebDriver.for :remote, :url => hub_url, :desired_capabilities => :firefox
      end
      if ENV['browser'] == 'chrome' || @driver == nil
        @driver = Selenium::WebDriver.for :remote, :url => hub_url, :desired_capabilities => :chrome
      end

      @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      @wait.extend(WaitMixIn)

      @pages = Pages.new(@driver, @wait)

      @driver.manage.window.resize_to 1920, 1080
      @driver.manage.timeouts.implicit_wait = 20
      @driver.manage.timeouts.page_load = 10

      @base_URL = 'http://nginx/'
    end

    def close
      @driver.quit
    end

    def navigate_home
      @driver.navigate.to @base_URL
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
      @driver.save_screenshot('images/' + filename + '.png')
    end

    def page_url
      url = @driver.current_url
      url.slice! @base_URL
      url.split("/")
    end

    def page
      current_url = page_url
      @pages.all_pages.each do |p|
        return p[:page] if p[:url] == current_url
        return p[:page] if (p[:url] & current_url == p[:url]) && (p[:url] != [])
      end
      nil
    end

  end

end
