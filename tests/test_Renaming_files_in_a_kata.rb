require_relative 'cyber_dojo_test'

class RunningTestsInAKataTest < CyberDojoTest

  def test_A_renamed_file_has_the_same_contents_as_the_original_file
    individual_create_and_join_kata

    edit_hiker_c("int answer() { return 42; }")

    rename_file('hiker.c', 'passing.c')

    run_kata_tests

    # If the original hiker.c file contents were still present then
    # the test would fail.
    assert_equal('green', traffic_light(0).attribute('data-colour'))
  end

  def rename_file(originalFileName, newFileName)
    select_file(originalFileName)

    rename_button.click

    rename_dialog_filename.clear
    rename_dialog_filename.send_keys(newFileName)

    rename_dialog_ok_button.click
  end

end
