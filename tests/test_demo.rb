require File.join(File.expand_path(File.dirname(__FILE__)), "cyber_dojo_test.rb")

class DemoTest < CyberDojoTest

  def test_check_the_home_page_title
    browser.navigate_home

    assert_equal "home", browser.title
  end

  def test_Creating_a_kata
    browser.navigate_home

    browser.save_screenshot('home')

    browser.home_page.setup_button.click

    browser.setup_default_start_point_show_languages_page.language("C++ (g++)").click
    browser.setup_default_start_point_show_languages_page.framework("assert").click

    browser.save_screenshot('setup')

    browser.setup_default_start_point_show_languages_page.next_button.click

    browser.setup_default_start_point_show_exercises_page.exercise("(Verbal)").click

    browser.save_screenshot('exercise')

  end

end