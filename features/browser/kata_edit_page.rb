require_relative 'page'

module CyberDojo

  class KataEditPage < Page

    def initialize(driver, browser, wait)
      super(driver, browser, wait)
      @wait_15_seconds = Selenium::WebDriver::Wait.new(:timeout => 15)
    end

    def load_completed?
      begin
        @driver.find_element(:id => 'test-button')
      rescue
        false
      end
    end

    def driver_action
      @driver.action
    end

    def test_button
      @wait.until_with_message(cant_find('button', 'test')) {
        @driver.find_element(:id => 'test-button')
      }
    end

    def rename_button
      @wait.until_with_message(cant_find('button', 'rename')) {
        @driver.find_element(:id => 'rename')
      }
    end

    def spinner
      @wait.until_with_message(cant_find('id', 'spinner')) {
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
      @wait.until_with_message(cant_find('count', 'traffic light')) {
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
      div = @wait.until_with_message(cant_find('div', 'traffic lights')) {
        @driver.find_element(:id => 'traffic-lights')
      }
      div.find_elements(:class => 'diff-traffic-light').count != 0
    end

    def select_file(filename)
      file = @wait.until_with_message("Unable to find file '#{filename}'") {
        find_item_in_cyber_dojo_list('filename-list', filename)
      }
      diagnostic = "Unable to click on file '#{filename}'"
      click_on_element_until_it_has_class(diagnostic, file, 'selected')
    end

    def editor
      @wait.until_with_message(cant_find('CodeMirror', 'editor')) {
        editor_divs = @driver.find_elements(:class => 'filename_div')
        editor = editor_divs.find { |e| e.displayed? }
        editor.find_element(:css => '.CodeMirror textarea') if !editor.nil?
      }
    end

    def test_output
      select_file('output')
      @wait.until_with_message(cant_find('CodeMirror', 'editor')) {
        editor_divs = @driver.find_elements(:class => 'filename_div')
        editor = editor_divs.find { |e| e.displayed? }
        if !editor.nil?
          codeMirror_div = editor.find_element(:css => '.CodeMirror')
          output = @driver.execute_script('return arguments[0].CodeMirror.getValue();', codeMirror_div)
          output.split
        else
          nil
        end
      }
    end

    def diff_dialog
      @wait.until_with_message(cant_find('dialog', 'diff')) {
        @driver.find_element(:id => 'diff-content')
      }
    end

    def select_diff(filename)
      file_diff = @wait.until_with_message(cant_find('file diff', filename)) {
        find_item_in_cyber_dojo_list('diff-filenames', filename)
      }
      diagnostic = "Unable to click on file diff '#{filename}'"
      click_on_element_until_it_has_class(diagnostic, file_diff, 'selected')
    end

    def diff_view
      diff_divs = @wait.until_with_message(cant_find('view', 'diff')) {
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

    def rename_dialog_filename
      @wait.until_with_message(cant_find('text input', 'renaming file')) {
        @driver.find_element(:id => 'rename-filename')
      }
    end

    def rename_dialog_ok_button
      @wait.until_with_message(cant_find('ok button', 'renaming a file')) {
        @driver.find_element(:id => 'file-ok')
      }
    end

    private

    def traffic_light_elements
      @wait.until_with_message(cant_find('class', 'traffic lights')) {
        @driver.find_element(:id => 'traffic-lights').find_elements(:class => 'diff-traffic-light')
      }
    end

    def url_to_id_and_avatar
      /([0-9A-Za-z]*)\?avatar\=([a-z]*)/.match(@browser.page_url[2])
    end

    def cant_find(type, name)
      "Cant find #{type} #{quoted(name)} on #{page} page"
    end

    def quoted(text)
      '"' + text + '"'
    end

    def page
      quoted('kata/edit')
    end

  end # class

end # module
