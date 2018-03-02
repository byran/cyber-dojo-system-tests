require_relative 'page'

module CyberDojo

  class SetupDefaultStartPointShowPage < Page

    def load_completed?
      begin
        @driver.find_element(:id => 'languages-list') &&
        @driver.find_element(:id => 'exercises-list') &&
        @driver.find_element(:id => 'ok')
      rescue
        false
      end
    end

    def select_display_name(display_name)
      selected = @wait.until_with_message(cant_find('display_name', display_name)) {
        find_item_in_cyber_dojo_list('languages-list', display_name)
      }
      click_msg = cant_click('display_name', display_name)
      click_on_element_until_it_has_class(click_msg, selected, 'selected')
    end

    def select_exercise(exercise_name)
      selected = @wait.until_with_message(cant_find('exercise', exercise_name)) {
        find_item_in_cyber_dojo_list('exercises-list', exercise_name)
      }
      click_msg = cant_click('exercise', exercise_name)
      click_on_element_until_it_has_class(click_msg, selected, 'selected')
    end

    def ok_button
      @wait.until_with_message(cant_find('button', 'ok')) {
        @driver.find_element(:id => 'ok')
      }
    end

    private

    def page
      'setup_default_start_point/show'
    end

    def cant_find(type, name)
      "Cant find #{type} #{quoted(name)} on #{quoted(page)} page"
    end

    def cant_click(type, name)
      "Cant click on #{type} #{quoted(name)} on #{quoted(page)} page"
    end

    def quoted(text)
      '"' + text + '"'
    end

  end # class

end # module
