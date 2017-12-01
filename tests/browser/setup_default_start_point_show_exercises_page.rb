require_relative 'page'

module CyberDojo

  class SetupDefaultStartPointShowExercisesPage < Page

    def load_completed?
      begin
        find_item_in_cyber_dojo_list('exercises-list', 'Zeckendorf Number') &&
            !@driver.find_element(:id => 'create-it-individual').nil? &&
            !@driver.find_element(:id => 'create-it-team').nil?
      rescue
        false
      end
    end

    def select_exercise(name)
      exercise = @wait.until_with_message("Unable to find exercise '#{name}' on \"setup_default_start_point/show_exercises\" page") {
        find_item_in_cyber_dojo_list('exercises-list', name)
      }
      click_on_element_until_it_has_class("Unable to click on exercise '#{name}' on \"setup_default_start_point/show_exercises\" page", exercise, 'selected')
    end

    def set_it_up_button_individual
      @wait.until_with_message("Unable to find 'set it up & start programming' button on \"setup_default_start_point/show_exercises\" page") {
        @driver.find_element(:id => 'create-it-individual')
      }
    end

    def set_it_up_button_team
      @wait.until_with_message("Unable to find 'set it up & show the hex-id' button on \"setup_default_start_point/show_exercises\" page") {
        @driver.find_element(:id => 'create-it-team')
      }
    end

    # Enter dojo dialog
    def dojo_id
      @wait.until_with_message("Unable to find dojo id in enter dojo dialog on \"setup_default_start_point/show_exercises\" page") {
        @driver.find_element(:id => 'dojo-id')
      }
    end

    def enter_page_button
      @wait.until_with_message("Unable to find enter page button in enter dojo dialog on \"setup_default_start_point/show_exercises\" page") {
        @driver.find_element(:class => 'enter-page')
      }
      end

    # Start coding dialog
    def avatar_image
      @wait.until_with_message("Unable to find avatar image in start coding dialog on \"setup_default_start_point/show_exercises\" page") {
        @driver.find_element(:class => 'avatar_image')
      }
    end

    def ok_button
      @wait.until_with_message("Unable to find ok button in start coding dialog on \"setup_default_start_point/show_exercises\" page") {
        buttons = @driver.find_elements(:class => 'ui-button-text')
        index = buttons.find_index { |b| b.text == 'ok' }
        buttons[index]
      }
    end

  end

end
