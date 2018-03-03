require_relative 'page'

module CyberDojo

  class GroupShowPage < Page

    def load_completed?
      begin
        @driver.find_element(:id => 'join') &&
        @driver.find_element(:id => 'create') &&
        @driver.find_element(:id => 'create-custom') &&
        @driver.find_element(:id => 'rejoin') &&
        @driver.find_element(:id => 'review')
      rescue
        false
      end
    end

    def join_button
      @wait.until_with_message(cant_find('join a session')) {
        @driver.find_element(:id => 'join')
      }
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

    def review_button
      @wait.until_with_message(cant_find('review a session')) {
        @driver.find_element(:id => 'review')
      }
    end

    private

    def cant_find(text)
      "Cant find button [#{text}] on group page"
    end

  end # class

end # module
