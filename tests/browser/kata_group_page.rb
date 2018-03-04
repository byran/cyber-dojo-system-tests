require_relative 'page'

module CyberDojo

  class KataGroupPage < Page

    def load_completed?
      begin
        @driver.find_element(:id => 'ok')
      rescue
        false
      end
    end

    def ok_button
      @wait.until_with_message(cant_find_button('ok')) {
        @driver.find_element(:id => 'ok')
      }
    end

    def short_kata_id
      element = @wait.until_with_message(cant_find_element('kata-id')) {
        @driver.find_element(:id => 'kata-id')
      }
      @driver.textContent_of(element).strip
    end

    private

    def cant_find_button(text)
      "Cant find button [#{text}] on \"kata/group\" page"
    end

    def cant_find_element(text)
      "Cant find element [#{text}] on \"kata/group\" page"
    end

  end # class

end # module
