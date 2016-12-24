require 'selenium-webdriver'

require_relative 'pages'
require_relative 'wait_mixin'
require_relative 'driver_mix_in'

module CyberDojo

  class Browser

    attr_reader :wait
    attr_reader :pages
    attr_reader :base_URL

    attr_reader :default_implicit_timeout

    def initialize
      @start_time = Time::now
      @last_time = @start_time
      @default_implicit_timeout = 20

      create_browser

      @wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      @wait.extend(WaitMixIn)

      @pages = Pages.new(@driver, self, @wait)

      @base_URL = 'http://nginx/'
    end

    private

    def create_browser
      hub_url = ENV['hub']
      hub_url = 'http://hub:4444/wd/hub' if hub_url.nil?

      if ENV['browser'] == 'firefox'
        @driver = Selenium::WebDriver.for(:remote, :url => hub_url, :desired_capabilities => :firefox)
      end
      if ENV['browser'] == 'chrome' || @driver == nil
        @driver = Selenium::WebDriver.for(:remote, :url => hub_url, :desired_capabilities => :chrome)
      end
      @driver.extend(DriverMixIn)

      @driver.manage.window.resize_to(1920, 1080)
      @driver.manage.timeouts.implicit_wait = @default_implicit_timeout
      @driver.manage.timeouts.page_load = 10
    end

    public

    def close
      @driver.quit
      @driver = nil
    end

    def restart
      close
      create_browser
      @pages.update_driver(@driver)
    end

    def debug_print_timing(message)
      current_time = Time::now
      time_since_start = (current_time - @start_time).round(2)
      time_since_last = (current_time - @last_time).round(2)

      print "---- Timing ----\n"
      print message + "\n" if !message.nil?
      print 'Since start : ' + time_since_start.to_s + "\n"
      print 'Since last  : ' + time_since_last.to_s + "\n"
      print "----------------\n"

      @last_time = current_time
    end

    def navigate_home
      @driver.navigate.to(@base_URL)
    end

    def title
      @driver.title
    end

    def switch_to_window(index)
      @wait.until { @driver.window_handles.count > index }
      @driver.switch_to.window(@driver.window_handles[index])
    end

    def switch_to_window_with_title_starting_with(title)
      windows = @driver.window_handles

      for handle in windows
        @driver.switch_to.window(handle)
        return true if @driver.title.start_with?(title)
      end

      false
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
        return p[:page] if beginning_of_first_array_matches_beginning_of_second_array(p[:url], current_url)
      end
      nil
    end

    private

    def beginning_of_first_array_matches_beginning_of_second_array(a, b)
      return a == b if a.count == 0

      a == b[0 .. a.count - 1]
    end

  end

end
