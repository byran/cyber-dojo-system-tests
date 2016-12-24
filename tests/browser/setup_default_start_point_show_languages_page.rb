require_relative 'page'

module CyberDojo

  class SetupDefaultStartPointShowLanguagesPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => 'languages-list').nil? &&
            !@driver.find_element(:id => 'tests-list').nil? &&
            !@driver.find_element(:id => 'choose-exercise').nil?
      rescue
        false
      end
    end

    def select_language(name)
      language = @wait.until_with_message("Unable to find language '#{name}' on \"setup_default_start_point/show_languages\" page") {
        find_item_in_cyber_dojo_list('languages-list', name)
      }
      click_on_element_until_it_has_class("Unable to click on language '#{name}' on \"setup_default_start_point/show_languages\" page", language, 'selected')
    end

    def select_framework(name)
      framework = @wait.until_with_message("Unable to find framework '#{name}' on \"setup_default_start_point/show_languages\" page") {
        find_item_in_cyber_dojo_list('tests-list', name)
      }
      click_on_element_until_it_has_class("Unable to click on framework '#{name}' on \"setup_default_start_point/show_languages\" page", framework, 'selected')
    end

    def next_button
      @wait.until_with_message("Unable to find next button on \"setup_default_start_point/show_languages\" page") {
        @driver.find_element(:id => 'choose-exercise')
      }
    end

  end

end
