require_relative 'page_steps'

module CyberDojo

  class EnterReviewPageSteps < PageSteps

    def open_a_dashboard_for_kata
      dashboard_button.click

      assert_page_loaded(pages.dashboard_show)
    end

    def open_a_dashboard_for_kata_with_id(id)
      kata_id_text_box.send_keys(id)
      wait_for_button_to_be_enabled(dashboard_button)
      open_a_dashboard_for_kata
    end

  end

end
