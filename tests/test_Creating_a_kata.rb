require_relative 'cyber_dojo_test'

class CreatingAKataTest < CyberDojoTest

  def test_Creating_a_kata
    navigate_home

    start_setting_up_a_kata

    select_a_language_and_framework('C (gcc)', 'assert')

    select_an_exercise_then_enter_kata('(Verbal)')

    assert_page_loaded(pages.kata_edit)
  end

end
