require File.join(File.expand_path(File.dirname(__FILE__)), "cyber_dojo_test.rb")

class CreatingAKataTest < CyberDojoTest

  def test_Creating_a_kata
    browser.navigate_home

    browser.home_page.setup_button.click

    browser.setup_default_start_point_show_languages_page.language("C++ (g++)").click
    browser.setup_default_start_point_show_languages_page.framework("assert").click
    browser.setup_default_start_point_show_languages_page.next_button.click

    browser.setup_default_start_point_show_exercises_page.select_exercise "(Verbal)"
    browser.setup_default_start_point_show_exercises_page.set_it_up_button.click

    browser.setup_default_start_point_show_exercises_page.start_coding_button.click

    browser.setup_default_start_point_show_exercises_page.ok_button.click
  end

end