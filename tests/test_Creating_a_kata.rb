require File.join(File.expand_path(File.dirname(__FILE__)), "cyber_dojo_test.rb")

class CreatingAKataTest < CyberDojoTest

  def test_Creating_a_kata
    browser.navigate_home

    assert_page_loaded(browser.home_page)

    browser.home_page.setup_button.click

    assert_page_loaded(browser.setup_default_start_point_show_languages_page)

    browser.setup_default_start_point_show_languages_page.select_language "C++ (g++)"
    browser.setup_default_start_point_show_languages_page.select_framework "assert"
    browser.setup_default_start_point_show_languages_page.next_button.click

    assert_page_loaded(browser.setup_default_start_point_show_exercises_page)

    browser.setup_default_start_point_show_exercises_page.select_exercise "(Verbal)"
    browser.setup_default_start_point_show_exercises_page.set_it_up_button.click

    browser.setup_default_start_point_show_exercises_page.start_coding_button.click

    browser.setup_default_start_point_show_exercises_page.ok_button.click

    browser.switch_to_window 1

    assert_page_loaded(browser.kata_edit_page)
  end

end