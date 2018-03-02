require_relative 'cyber_dojo_test'

class CreatingAKataGroupTest < CyberDojoTest

  def test_Creating_a_kata_group
    navigate_home
    were_in_a_group_button.click

    assert_page_loaded(pages.group)
    create_a_new_session_button.click

    assert_page_loaded(pages.setup_default_start_point_show)
    select_display_name('C (gcc), assert')
    select_exercise('(Verbal)')
    ok_button.click

    assert_page_loaded(pages.kata_group)
    ok_button.click

    assert_page_loaded(pages.dashboard_show)
  end

end

