require_relative 'cyber_dojo_test'

class DiffingInAKataTest < CyberDojoTest

  def test_A_diff_dialog_appears_when_a_traffic_light_is_clicked
    create_and_enter_kata

    edit_hiker_c("int answer(void) { return 49; }")
    run_kata_tests

    edit_hiker_c("int answer(void) { return 42; }")
    run_kata_tests

    traffic_light(1).click

    refute_nil(diff_dialog, 'Could not find the diff dialog')

    select_diff('hiker.c')

    expected = "#include \"hiker.h\"\n"
    expected += "int answer(void) { return 49; }\n"
    expected += "int answer(void) { return 42; }"

    assert_equal(expected, diff_view.text)
  end

end