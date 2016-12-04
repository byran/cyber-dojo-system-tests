require File.join(File.expand_path(File.dirname(__FILE__)), "page.rb")

module CyberDojo
  class MainPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => "setup-a-new-practice-session-button").nil? &&
            !@driver.find_element(:id => "enter-button").nil? &&
            !@driver.find_element(:id => "donate-button").nil?
      rescue
        false
      end
    end

    def setup_button
      @wait.until { @driver.find_element :id => 'setup-a-new-practice-session-button' }
    end

    def enter_button
      @wait.until { @driver.find_element :id => 'enter-button' }
    end

    def donate_button
      @wait.until { @driver.find_element :id => 'donate-button' }
    end

  end
end
