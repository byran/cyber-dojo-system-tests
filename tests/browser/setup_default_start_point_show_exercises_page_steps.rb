require_relative 'page_steps'

module CyberDojo

  class SetupDefaultStartPointShowExercisesPageSteps < PageSteps

    def select_an_exercise_then_enter_kata(exercise)
      select_exercise(exercise)
      set_it_up_button.click

      start_coding_button.click

      ok_button.click

      browser.switch_to_window(1)

      assert_page_loaded(pages.kata_edit)
    end

  end

end
