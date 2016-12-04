require File.join(File.expand_path(File.dirname(__FILE__)), "page.rb")

module CyberDojo
  class SetupDefaultStartPointShowExercisesPage < Page

    def load_completed?
      begin
        CyberDojo::find_item_in_cyber_dojo_list(@driver, "exercises-list", "Zeckendorf Number") &&
            !@driver.find_element(:id => "create-it").nil?
      rescue
        false
      end
    end

    def select_exercise(name)
      exercise = @wait.until { CyberDojo::find_item_in_cyber_dojo_list(@driver, "exercises-list", name) }
      exercise.click
    end

    def set_it_up_button
      @wait.until { @driver.find_element :id => "create-it" }
    end

    # Enter dojo dialog
    def dojo_id
      @wait.until { @driver.find_element :id => "dojo-id" }
    end

    def enter_page_button
      @wait.until { @driver.find_element :class => "enter-page" }
    end

    def start_coding_button
      @wait.until { @driver.find_element :class => "start-coding" }
    end

    # Start coding dialog
    def avatar_image
      @wait.until { @driver.find_element :class => "avatar_image" }
    end

    def ok_button
      buttons = @wait.until { @driver.find_elements :class => "ui-button-text" }

      index = buttons.find_index { |b| b.text == "ok" }

      buttons[index]
    end

    end
end
