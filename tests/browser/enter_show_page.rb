require_relative 'page'

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
      @wait.until_with_message('Unable to find kata id text box on "enter/show" page') {
        @driver.find_element(:id => 'kata-id-input')
      }
    end

    def start_coding_button
      @wait.until_with_message('Unable to find start coding button on "enter/show" page') {
        @driver.find_element(:id => 'start-button')
      }
    end

    def dashboard_button
      @wait.until_with_message('Unable to find dashboard button on "enter/show" page') {
        @driver.find_element(:id => 'dashboard-button')
      }
    end

    def resume_coding_button
      @wait.until_with_message('Unable to find resume coding button on "enter/show" page') {
        @driver.find_element(:id => 'resume-button')
      }
    end

    # Start coding dialog
    def ok_button
      @wait.until_with_message('Unable to find ok button in start coding dialog on "enter/show" page') {
        buttons = @driver.find_elements(:class => 'ui-button-text')
        index = buttons.find_index { |b| b.text == 'ok' }
        buttons[index]
      }
    end

    # Resume coding dialog
    def resume_dialog
      @wait.until_with_message('Unable to find resume dialog on "enter/show" page') {
        @driver.find_element(:class => 'ui-dialog')
      }
    end

    def resume_avatar(avatar)
      dialog = resume_dialog
      images = @wait.until_with_message('Unable to find avatar images in resume dialog on "enter/show" page') {
        dialog.find_elements(:tag_name => 'img')
      }
      for image in images
        return image if (image.attribute('title') == avatar)
      end
      nil
    end

  end
end
