require_relative 'page'

module CyberDojo

  class IndividualPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => 'create').nil? &&
        !@driver.find_element(:id => 'create-custom').nil? &&
        !@driver.find_element(:id => 'rejoin').nil?
      rescue
        false
      end
    end

    def create_a_new_session_button
      @wait.until_with_message(cant_find('create a new session')) {
        @driver.find_element(:id => 'create')
      }
    end

    def create_a_new_custom_session_button
      @wait.until_with_message(cant_find('create a new custom session')) {
        @driver.find_element(:id => 'create-custom')
      }
    end

    def rejoin_button
      @wait.until_with_message(cant_find('rejoin a session')) {
        @driver.find_element(:id => 'rejoin')
      }
    end

    private

    def cant_find(text)
      "Cant find button [#{text}] on individual page"
    end

  end # class

end # module
