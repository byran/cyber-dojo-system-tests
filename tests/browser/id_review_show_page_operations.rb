require_relative 'page_operations'

module CyberDojo

  class IdReviewShowPageOperations < PageOperations

    def enter_kata_id(id)
      id_text_box.send_keys(id)
    end

  end

end