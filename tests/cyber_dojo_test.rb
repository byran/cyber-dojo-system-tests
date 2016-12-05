require 'minitest/autorun'

require_relative './browser/browser.rb'

class CyberDojoTest < Minitest::Test

  def setup
    @browser = CyberDojo::Browser.new
  end

  def teardown
    @browser.close
  end

  attr_reader :browser

  def pages
    @browser.pages
  end

  def assert_page_loaded(page)
    assert @browser.wait.until_or_false{ page.load_completed? }, 'Failed to load page'
  end

end
