module CyberDojo
  module CommonOperations

    def debug_print_timing(message)
      browser.debug_print_timing(message)
    end

    def pages
      browser.pages
    end

    def wait_for_button_to_be_enabled(button)
      assert(@browser.wait.until_or_false{
        true if button.enabled?
      }, "'#{button.text}' button was not enabled")
    end

    def switch_to_editor_window(index = 1)
      @browser.switch_to_window(index)
      assert_page_loaded(pages.kata_edit)
    end

    def navigate_home
      @browser.navigate_home

      assert_page_loaded(pages.main)
    end
=begin
    def create_and_enter_kata(language = "C (gcc)", framework = "assert", exercise = "(Verbal)")
      navigate_home

      start_setting_up_a_kata

      select_a_language_and_framework(language, framework)

      select_an_exercise_then_enter_kata(exercise)
    end

    def create_an_avatar_with_two_tests_one_failing_and_one_passing
      create_and_enter_kata

      run_a_failing_test
      run_a_passing_test
    end

    def create_another_avatar_in_the_same_kata
      switch_to_window_showing_home_page
      start_entering_an_existing_kata
      start_a_new_avatar
    end

    def switch_to_window_showing_home_page
      @browser.switch_to_window_with_title_starting_with('home')
      assert_page_loaded(pages.main)
    end
=end
  end
end
