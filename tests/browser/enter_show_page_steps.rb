require_relative 'page_steps'

module CyberDojo

  class EnterShowPageSteps < PageSteps

    def enter_kata_id(id)
      kata_id_text_box.send_keys(id)
    end

    def resume_coding_using_avatar(avatar_animal)
      wait_for_button_to_be_enabled(resume_coding_button)
      resume_coding_button.click
      resume_avatar(avatar_animal).click
    end

    def start_a_new_kata
      wait_for_button_to_be_enabled(start_coding_button)
      start_coding_button.click
      ok_button.click
    end

  end # class EnterShowPageSteps

end # module CyberDojo
