require_relative './page.rb'

module CyberDojo
  class DashboardShowPage < Page

    def load_completed?
      begin
        auto_refresh = @driver.find_element(:id => 'auto-refresh-container')
        minute_column = @driver.find_element(:id => 'minute-columns-container')
        footer = @driver.find_element(:id => 'footer')

        !auto_refresh.nil? &&
            auto_refresh.displayed? &&
            !minute_column.nil? &&
            minute_column.displayed? &&
            !footer.nil? &&
            footer.displayed?
      rescue
        false
      end
    end

    def auto_refresh_checkbox
      @wait.until { @driver.find_element(:id => 'auto-refresh-container').find_element(:tag_name => 'label') }
    end

    def minute_columns_checkbox
      @wait.until { @driver.find_element(:id => 'minute-columns-container').find_element(:tag_name => 'label') }
    end

    def traffic_light_count(avatar)
      traffic_lights_table_row_for_avatar(avatar).find_element(:class => 'traffic-light-count')
    end

    private

    def traffic_lights_table_row_for_avatar(avatar)
      rows = @wait.until {
        @driver.find_element(:id => 'traffic-lights').find_elements(:tag_name => 'tr')
      }

      for row in rows
        avatar_image_div = row.find_element(:class => 'avatar-image')
        return row if !avatar_image_div.nil? && avatar_image_div.attribute('data-avatar-name') == avatar
      end

      nil
    end

  end
end
