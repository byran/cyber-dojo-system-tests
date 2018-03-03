require_relative 'cyber_dojo_test'

class DiffingInAKataTest < CyberDojoTest

  def test_A_diff_dialog_appears_when_a_traffic_light_is_clicked
    individual_create_and_join_kata

    edit_hiker_rb('def answer; 49; end')
    run_kata_tests

    edit_hiker_rb('def answer; 42; end')
    run_kata_tests

    traffic_light(1).click

    refute_nil(diff_dialog, 'Could not find the diff dialog')

    select_diff('hiker.rb')

    expected = ''
    expected += "def answer; 49; end\n"
    expected += 'def answer; 42; end'

    assert_equal(expected, diff_view.text)
  end

end