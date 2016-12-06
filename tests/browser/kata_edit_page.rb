require_relative './page.rb'

module CyberDojo
  class KataEditPage < Page

    def initialize(driver, wait)
      super(driver, wait)

      @wait_11_seconds = Selenium::WebDriver::Wait.new(:timeout => 11)
    end

    def load_completed?
      begin
        !@driver.find_element(:id => 'test-button').nil?
      rescue
        false
      end
    end

    def test_button
      @wait.until { @driver.find_element(:id => 'test-button') }
    end

    def spinner
      @wait.until { @driver.find_element(:id => 'test-spinner') }
    end

    def wait_for_spinner_to_show_and_hide
      s = spinner
      @wait_11_seconds.until { !s.displayed? }
    end

    def number_of_traffic_lights
      traffic_light_elements.count
    end

    def traffic_light_count_element
      @wait.until { @driver.find_element(:class => "traffic-light-count") }
    end

    def traffic_light(index)
      traffic_light_elements[index]
    end

    def traffic_light_image(index)
      traffic_light_elements[index].find_element(:tag_name => "img")
    end

    def select_file(filename)
      file = @wait.until { CyberDojo::find_item_in_cyber_dojo_list(@driver, 'filename-list', filename) }
      @driver.scroll_into_view file
      file.click
    end

    def editor
      editor_divs = @wait.until { @driver.find_elements :class => 'filename_div' }
      editor = editor_divs.find { |e| e.displayed? }
      editor.find_element :class => 'file_content' if !editor.nil?
    end

    private

    def traffic_light_elements
      @wait.until { @driver.find_element(:id => "traffic-lights").find_elements(:class => "diff-traffic-light") }
    end

  end
end
