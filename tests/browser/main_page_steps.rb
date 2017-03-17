require_relative 'page_steps'

module CyberDojo

  class MainPageSteps < PageSteps

    def start_setting_up_a_kata
      setup_button.click

      assert_page_loaded(pages.setup_default_start_point_show_languages)
    end

  end

end

