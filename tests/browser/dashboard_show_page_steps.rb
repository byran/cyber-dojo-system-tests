require_relative 'page_steps'

module CyberDojo

  class DashboardShowPageSteps < PageSteps

    def toggle_auto_refresh
      checkbox = auto_refresh_checkbox
      checkbox.click
      assert_page_loaded(pages.dashboard_show)
    end

  end

end
