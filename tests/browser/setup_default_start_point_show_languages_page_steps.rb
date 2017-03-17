require_relative 'page_steps'

module CyberDojo

  class SetupDefaultStartPointShowLanguagesPageSteps < PageSteps

    def select_a_language_and_framework(language, framework)
      select_language(language)
      select_framework(framework)
      next_button.click
      assert_page_loaded(pages.setup_default_start_point_show_exercises)
    end

  end

end
