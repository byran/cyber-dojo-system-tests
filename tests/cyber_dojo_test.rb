require "minitest/autorun"

require "./cyber_dojo_browser"

class CyberDojoTest < Minitest::Test

  def setup
    @browser = CyberDojoBrowser.new
  end

  def teardown
    @browser.close
  end

  attr_reader :browser

end
