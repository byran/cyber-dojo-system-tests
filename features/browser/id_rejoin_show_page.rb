require_relative 'page'

module CyberDojo

  class IdRejoinShowPage < Page

    def load_completed?
      begin
        @driver.find_element(:id => 'id')
      rescue
        false
      end
    end

    def id_text_box
      @wait.until_with_message('Unable to find id text box on "id_rejoin/show" page') {
        @driver.find_element(:id => 'id')
      }
    end

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

  end

end

