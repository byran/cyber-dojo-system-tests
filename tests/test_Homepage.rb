require File.join(File.expand_path(File.dirname(__FILE__)), "cyber_dojo_test.rb")

class HomepageTest < CyberDojoTest

  def test_check_the_home_page_title
    browser.navigate_home

    assert_equal "home", browser.title
  end

end