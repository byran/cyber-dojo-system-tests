require "minitest/autorun"

require File.join(File.expand_path(File.dirname(__FILE__)), "browser/browser.rb")

class CyberDojoTest < Minitest::Test

  def setup
    @browser = CyberDojoBrowser.new
  end

  def teardown
    @browser.close
  end

  attr_reader :browser

end
