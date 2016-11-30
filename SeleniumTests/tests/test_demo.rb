require "./cyber_dojo_test"

class TestDemo < CyberDojoTest

  def test_check_the_home_page_title
    browser.navigate_home

    assert_equal "home", browser.title
  end

  def test_navigating_to_the_setup_page
    browser.navigate_home

    browser.save_screenshot('home')

    browser.home_page.setup_button.click

    browser.setup_default_start_point_page.language("C++ (g++)").click

    sleep(1)

    browser.save_screenshot('setup')
  end

end