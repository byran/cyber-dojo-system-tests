require_relative 'page_operations'

module CyberDojo

  class DashboardShowPageOperations < PageOperations

    def toggle_auto_refresh
      checkbox = auto_refresh_checkbox
      checkbox.click
      assert_page_loaded(pages.dashboard_show)
    end

  end

end
