require_relative 'cyber_dojo_test'

class CreatingAKataTest < CyberDojoTest

  def test_Creating_a_kata
    navigate_home

    im_on_my_own_button.click
    assert_page_loaded(pages.individual)

    create_a_new_session_button.click
    assert_page_loaded(pages.setup_default_start_point_show)

    #These appear to be running before the list has 'settled'
    #select_display_name('C (gcc), assert')
    #select_exercise('(Verbal)')
    ok_button.click
    assert_page_loaded(pages.kata_individual)

    ok_button.click
    switch_to_editor_window
    assert_page_loaded(pages.kata_edit)
  end

end

