require_relative 'page_steps'

module CyberDojo

  class MainPageSteps < PageSteps

    def start_setting_up_a_kata
      setup_button.click

      assert_page_loaded(pages.setup_default_start_point_show_languages)
    end

    def start_entering_an_existing_dojo
      enter_button.click
      assert_page_loaded(pages.enter_show)
    end

    def start_reviewing_a_kata
      review_button.click
      assert_page_loaded(pages.enter_review)
    end

  end

end

