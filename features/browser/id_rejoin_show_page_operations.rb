require_relative 'page_operations'

module CyberDojo

  class IdRejoinShowPageOperations < PageOperations

    def enter_kata_id(id)
      id_text_box.send_keys(id)
    end

    def rejoin_coding_using_avatar(animal)
      rejoin_avatar_image(animal).click
    end

  end

end