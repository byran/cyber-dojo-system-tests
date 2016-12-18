require_relative './page.rb'

module CyberDojo
  class EnterShowPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => 'kata-id-input').nil? &&
            !@driver.find_element(:id => 'start-button').nil? &&
            !@driver.find_element(:id => 'resume-button').nil?
      rescue
        false
      end
    end


    def kata_id_text_box
      @wait.until { @driver.find_element(:id => 'kata-id-input') }
    end

    def start_coding_button
      @wait.until { @driver.find_element(:id => 'start-button') }
    end

    def dashboard_button
      @wait.until { @driver.find_element(:id => 'dashboard-button') }
    end

    def resume_coding_button
      @wait.until { @driver.find_element(:id => 'resume-button') }
    end

    # Start coding dialog
    def ok_button
      buttons = @wait.until { @driver.find_elements :class => 'ui-button-text' }
      index = buttons.find_index { |b| b.text == 'ok' }
      buttons[index]
    end

    # Resume coding dialog
    def resume_dialog
      @wait.until { @driver.find_element(:class => 'ui-dialog') }
    end

    def resume_avatar(avatar)
      images = @wait.until { resume_dialog.find_elements(:tag_name => 'img') }
      for image in images
        return image if (image.attribute('title') == avatar)
      end
      nil
    end

  end
end
