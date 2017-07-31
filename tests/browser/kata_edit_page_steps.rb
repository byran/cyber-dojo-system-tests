require_relative 'page_steps'

module CyberDojo

  class KataEditPageSteps < PageSteps

    def edit_hiker_c(content)
      select_file('hiker.c')

      editor # This waits for the editor to appear

      driver_action.key_down(:control)
          .send_keys("a")
          .key_up(:control)
          .send_keys(:delete)
          .perform

      driver_action.send_keys("#include \"hiker.h\"\n").perform
      driver_action.send_keys("#{content}\n").perform
    end

    def run_kata_tests
      test_button.click
      wait_for_spinner_to_show_and_hide
    end

    def run_a_failing_test
      edit_hiker_c("int answer(void) { return 47; }")
      run_kata_tests
    end

    def run_a_passing_test
      edit_hiker_c("int answer(void) { return 42; }")
      run_kata_tests
    end

  end

end
