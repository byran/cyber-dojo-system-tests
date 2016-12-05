require_relative './cyber_dojo_test.rb'

class CreatingAKataTest < CyberDojoTest

  def test_Creating_a_kata
    browser.navigate_home

    assert_page_loaded(pages.main)

    browser.page.setup_button.click

    assert_page_loaded(pages.setup_default_start_point_show_languages)

    browser.page.select_language 'C (gcc)'
    browser.page.select_framework 'assert'
    browser.page.next_button.click

    assert_page_loaded(pages.setup_default_start_point_show_exercises)

    browser.page.select_exercise '(Verbal)'
    browser.page.set_it_up_button.click

    browser.page.start_coding_button.click

    browser.page.ok_button.click
    sleep 2

    browser.switch_to_window 1

    assert_page_loaded(pages.kata_edit)
  end

end