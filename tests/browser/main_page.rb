require_relative 'page'

module CyberDojo

  class MainPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => 'individual').nil? &&
        !@driver.find_element(:id => 'group').nil? &&
        !@driver.find_element(:id => 'donate').nil?
      rescue
        false
      end
    end

    def im_on_my_own_button
      @wait.until_with_message(cant_find("i'm on my own")) {
        @driver.find_element(:id => 'individual')
      }
    end

    def were_in_a_group_button
      @wait.until_with_message(cant_find("we're in a group")) {
        @driver.find_element(:id => 'group')
      }
    end

    def donate_button
      @wait.until_with_message(cant_find('donate')) {
        @driver.find_element(:id => 'donate')
      }
    end

    private

    def cant_find(text)
      "Unable to find button [#{text}] on home page"
    end

  end

end
