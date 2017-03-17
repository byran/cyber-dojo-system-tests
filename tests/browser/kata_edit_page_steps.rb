require_relative 'page_steps'

module CyberDojo

  class KataEditPageSteps < PageSteps

    def run_a_failing_test
      select_file('hiker.c')

      editor.clear
      editor.send_keys("#include \"hiker.h\"\n")
      editor.send_keys("int answer(void) { return 47; }\n")

      test_button.click

      wait_for_spinner_to_show_and_hide
    end

    def run_a_passing_test
      select_file('hiker.c')

      editor.clear
      editor.send_keys("#include \"hiker.h\"\n")
      editor.send_keys("int answer(void) { return 42; }\n")

      test_button.click

      wait_for_spinner_to_show_and_hide
    end

  end

end
