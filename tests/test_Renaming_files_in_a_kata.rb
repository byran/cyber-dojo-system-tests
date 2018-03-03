require_relative 'cyber_dojo_test'

class RenamingFilesInAKataTest < CyberDojoTest

  def test_A_renamed_file_has_the_same_contents_as_the_original_file
    id,avatar = individual_create_and_join_kata
    edit_hiker_rb('def answer; 42; end')
    rename_file('hiker.rb', 'passing.rb')
    run_kata_tests
    # If the original hiker.rb file contents were still present
    # then the test would pass because test_hiker.rb has
    # require './hiker'
    diagnostic = "id=#{id},avatar=#{avatar}"
    assert_equal 'amber', traffic_light(0).attribute('data-colour'), diagnostic
  end

  # - - - - - - - - - - - - - - - - - - - - - - - - -

  def rename_file(original_filename, new_filename)
    select_file(original_filename)
    rename_button.click
    rename_dialog_filename.clear
    rename_dialog_filename.send_keys(new_filename)
    rename_dialog_ok_button.click
  end

end
