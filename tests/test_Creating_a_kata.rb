require File.join(File.expand_path(File.dirname(__FILE__)), "cyber_dojo_test.rb")

class CreatingAKataTest < CyberDojoTest

  def test_Creating_a_kata
    browser.navigate_home

    browser.home_page.setup_button.click

    browser.setup_default_start_point_show_languages_page.select_language "C++ (g++)"
    browser.setup_default_start_point_show_languages_page.select_framework "assert"
    browser.setup_default_start_point_show_languages_page.next_button.click

    # This stops a problem with chrome sometimes throwing an exception when trying to
    # click on the exercise name in the next step
    # TODO: Find a better way to wait for the page load to complete
    sleep 0.5

    browser.setup_default_start_point_show_exercises_page.select_exercise "(Verbal)"
    browser.setup_default_start_point_show_exercises_page.set_it_up_button.click

    browser.setup_default_start_point_show_exercises_page.start_coding_button.click

    browser.setup_default_start_point_show_exercises_page.ok_button.click
  end

end