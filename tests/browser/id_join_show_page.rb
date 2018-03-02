require_relative 'page'

module CyberDojo

  class IdJoinShowPage < Page

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

=begin
    def rejoin_avatar_image(animal)
      @wait.until_with_message('Unable to find avatar image') {
        avatars_div = @driver.find_element(:id => 'avatar-picker')
        avatars_list = avatars_div.find_elements(:tag_name => 'div')
        avatars_list.each do |avatar|
          if avatar.attribute('data-tip') == animal
            image = avatar.find_element(:tag_name => 'img')
            return image if image.displayed?
          end
        end
        nil
      }
    end
=end

  end # class

end # module

