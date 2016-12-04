require "minitest/autorun"

require File.join(File.expand_path(File.dirname(__FILE__)), "browser/browser.rb")

class CyberDojoTest < Minitest::Test

  def setup
    @browser = CyberDojo::Browser.new
  end

  def teardown
    @browser.close
  end

  attr_reader :browser

  def assert_page_loaded(page)
    begin
      @browser.wait.until { page.load_completed? }
    rescue
      flunk "Failed to load page"
    end
  end

end
