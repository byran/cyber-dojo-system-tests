require_relative 'page'

module CyberDojo

  class DashboardShowPage < Page

    def load_completed?
      begin
        auto_refresh = @driver.find_element(:id => 'auto-refresh-container')
        minute_column = @driver.find_element(:id => 'minute-columns-container')
        app_bar = @driver.find_element(:id => 'app-bar')

        !auto_refresh.nil? &&
            auto_refresh.displayed? &&
            !minute_column.nil? &&
            minute_column.displayed? &&
            !app_bar.nil? &&
            app_bar.displayed?
      rescue
        false
      end
    end

    def kata_id
      @browser.page_url[2]
    end

    def auto_refresh_checkbox
      @wait.until_with_message('Unable to find auto refresh checkbox on "dashboard/show" page') {
        @driver.find_element(:id => 'auto-refresh-container').find_element(:tag_name => 'label')
      }
    end

    def minute_columns_checkbox
      @wait.until_with_message('Unable to find minute columns checkbox on "dashboard/show" page') {
        @driver.find_element(:id => 'minute-columns-container').find_element(:tag_name => 'label')
      }
    end

    def traffic_light_count(avatar)
      traffic_lights_table_row_for_avatar(avatar).find_element(:class => 'traffic-light-count')
    end

    def traffic_light(avatar, test_index)
      traffic_lights = traffic_lights_table_row_for_avatar(avatar).find_elements(:class => 'diff-traffic-light')
      traffic_lights[test_index - 1]
    end

    def traffic_light_colour(avatar, test_index)
      traffic_light(avatar, test_index).attribute('data-colour')
    end

    private

    def traffic_lights_table_row_for_avatar(avatar)
      rows = @wait.until_with_message('Unable to find traffic lights on "dashboard/show" page') {
        @driver.find_element(:id => 'traffic-lights').find_elements(:tag_name => 'tr')
      }
      begin
        @driver.manage.timeouts.implicit_wait = 0.05
        for row in rows
          begin
            avatar_image_div = row.find_element(:class => 'avatar-image')
            return row if !avatar_image_div.nil? && avatar_image_div.attribute('data-avatar-name') == avatar
          rescue Selenium::WebDriver::Error::NoSuchElementError => ignore
            # Ignore NoSuchElementError as there may be
            # sub-table rows without an avatar-image
          end
        end
        nil
      ensure
        @driver.manage.timeouts.implicit_wait = @browser.default_implicit_timeout
      end
    end

  end # class

end # module
