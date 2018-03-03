require_relative 'page_steps'

module CyberDojo

  class IdJoinShowPageSteps < PageSteps

    def enter_kata_id(id)
      id_text_box.send_keys(id)
    end

  end

end