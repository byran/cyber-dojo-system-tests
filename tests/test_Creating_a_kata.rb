require_relative './cyber_dojo_test.rb'

class CreatingAKataTest < CyberDojoTest

  def test_Creating_a_kata
    browser.navigate_home

    assert_page_loaded(pages.main)

    setup_button.click

    assert_page_loaded(pages.setup_default_start_point_show_languages)

    select_language 'C (gcc)'
    select_framework 'assert'
    next_button.click

    assert_page_loaded(pages.setup_default_start_point_show_exercises)

    select_exercise '(Verbal)'
    set_it_up_button.click

    start_coding_button.click

    ok_button.click

    browser.switch_to_window 1

    assert_page_loaded(pages.kata_edit)
  end

end