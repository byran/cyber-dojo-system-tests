require_relative 'page'

module CyberDojo
  class KataEditPage < Page

    def initialize(driver, browser, wait)
      super(driver, browser, wait)

      @wait_15_seconds = Selenium::WebDriver::Wait.new(:timeout => 15)
    end

    def load_completed?
      begin
        !@driver.find_element(:id => 'test-button').nil?
      rescue
        false
      end
    end

    def test_button
      @wait.until_with_message('Unable to find test button on "kata/edit" page') {
        @driver.find_element(:id => 'test-button')
      }
    end

    def spinner
      @wait.until_with_message('Unable to find spinner on "kata/edit" page') {
        @driver.find_element(:id => 'test-spinner')
      }
    end

    def wait_for_spinner_to_show_and_hide
      s = spinner
      @wait_15_seconds.until { !s.displayed? }
    end

    def number_of_traffic_lights
      traffic_light_elements.count
    end

    def traffic_light_count_element
      @wait.until_with_message('Unable to find traffic light count on "kata/edit" page') {
        @driver.find_element(:class => "traffic-light-count")
      }
    end

    def traffic_light_count_element_present?
        @driver.find_elements(:class => "traffic-light-count").count != 0
    end

    def traffic_light(index)
      traffic_light_elements[index]
    end

    def traffic_light_image(index)
      traffic_light_elements[index].find_element(:tag_name => 'img')
    end

    def traffic_light_elements_present?
      div = @wait.until_with_message('Unable to find traffic lights div on "kata/edit" page') {
        @driver.find_element(:id => 'traffic-lights')
      }
      div.find_elements(:class => 'diff-traffic-light').count != 0
    end

    def select_file(filename)
      file = @wait.until_with_message("Unable to find file '#{filename}'") {
        find_item_in_cyber_dojo_list('filename-list', filename)
      }
      click_on_element_until_it_has_class("Unable to click on file '#{filename}'", file, 'selected')
    end

    def editor
      editor_divs = @wait.until_with_message('Unable to find editor on "kata/edit" page') {
        @driver.find_elements(:class => 'filename_div')
      }
      editor = editor_divs.find { |e| e.displayed? }
      editor.find_element(:class => 'file_content') if !editor.nil?
    end

    def diff_dialog
      @wait.until_with_message('Unable to find diff dialog on "kata/edit" page') {
        @driver.find_element(:id => 'diff-content')
      }
    end

    def select_diff(filename)
      file_diff = @wait.until_with_message("Unable to find file diff '#{filename}'") {
        find_item_in_cyber_dojo_list('diff-filenames', filename)
      }
      click_on_element_until_it_has_class("Unable to click on file diff '#{filename}'", file_diff, 'selected')
    end

    def diff_view
      diff_divs = @wait.until_with_message('Unable to find diff view on "kata/edit" page') {
        @driver.find_element(:id => 'diff-content').find_elements(:class => 'filename_div')
      }
      diff = diff_divs.find { |d| d.displayed? }
      diff.find_element(:class => 'diff-sheet') if !diff.nil?
    end

    def kata_id
      url_to_id_and_avatar[1]
    end

    def avatar
      url_to_id_and_avatar[2]
    end

    private

    def traffic_light_elements
      @wait.until_with_message('Unable to find traffic lights on "kata/edit" page') {
        @driver.find_element(:id => 'traffic-lights').find_elements(:class => 'diff-traffic-light')
      }
    end

    def url_to_id_and_avatar
      /([0-9A-F]*)\?avatar\=([a-z]*)/.match(@browser.page_url[2])
    end

  end
end
