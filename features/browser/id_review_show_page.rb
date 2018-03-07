require_relative 'page'

module CyberDojo

  class IdReviewShowPage < Page

    def load_completed?
      begin
        @driver.find_element(:id => 'id')
      rescue
        false
      end
    end

    def id_text_box
      @wait.until_with_message(cant_find('text box', 'id')) {
        @driver.find_element(:id => 'id')
      }
    end

    def ok_button
      @wait.until_with_message(cant_find('button', 'ok')) {
        ok = @driver.find_element(:id => 'ok')
        ok && ok.displayed? ? ok : nil
      }
    end

    private

    def cant_find(type, name)
      "Cant find #{type} #{quoted(name)} on #{quoted(page)} page"
    end

    def page
      'id_join/show'
    end

    def quoted(text)
      '"' + text + '"'
    end

  end # class

end # module

