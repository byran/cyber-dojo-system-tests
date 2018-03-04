require_relative 'page_operations'

module CyberDojo

  class KataEditPageOperations < PageOperations

    def edit_hiker_rb(content)
      edit_file('hiker.rb', content)
    end

    def edit_file(filename, content)
      select_file(filename)

      editor # This waits for the editor to appear

      driver_action.key_down(:control)
          .send_keys("a")
          .key_up(:control)
          .send_keys(:delete)
          .perform

      driver_action.send_keys(content+"\n").perform
    end

    # - - - - - - - - - - - - - - - - - - - - - - -

    def run_kata_tests
      test_button.click
      wait_for_spinner_to_show_and_hide
    end

    def run_a_failing_test
      edit_hiker_rb('def answer; 47; end')
      run_kata_tests
    end

    def run_a_passing_test
      edit_hiker_rb('def answer; 42; end')
      run_kata_tests
    end

  end

end
