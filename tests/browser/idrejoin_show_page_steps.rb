require_relative 'page_steps'

module CyberDojo

  class IdRejoinShowPageSteps < PageSteps

    def enter_kata_id(id)
      id_text_box.send_keys(id)
    end

    def resume_coding_using_avatar(animal)
      resume_avatar_image(animal).click
    end

  end

end