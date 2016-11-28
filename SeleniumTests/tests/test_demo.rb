require "./cyber_dojo_test"

class TestDemo < CyberDojoTest

  def test_check_the_home_page_title
    browser.navigate_home

    assert_equal "home", browser.title
 end

  def test_navigating_to_the_setup_page
    browser.navigate_home

    browser.save_screenshot('home')

    browser.page.setup_button.click

    sleep(2) # Need wait, instead of a sleep

    browser.save_screenshot('setup')
  end

end