require_relative 'page'

module CyberDojo

  class KataIndividualPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => 'ok').nil?
      rescue
        false
      end
    end

    def ok_button
      @wait.until_with_message(cant_find('ok')) {
        @driver.find_element(:id => 'ok')
      }
    end

    private

    def cant_find(text)
      "Cant find button [#{text}] on individual page"
    end

  end # class

end # module
