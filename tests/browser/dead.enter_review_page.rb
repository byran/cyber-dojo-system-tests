require_relative 'page'

module CyberDojo

  class EnterReviewPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => 'kata-id-input').nil? &&
            !@driver.find_element(:id => 'dashboard-button').nil?
      rescue
        false
      end
    end

    def kata_id_text_box
      @wait.until_with_message('Unable to find kata id text box on "enter/review" page') {
        @driver.find_element(:id => 'kata-id-input')
      }
    end

    def dashboard_button
      @wait.until_with_message('Unable to find dashboard button on "enter/review" page') {
        @driver.find_element(:id => 'dashboard-button')
      }
    end

  end # class

end # module
