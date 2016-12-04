require File.join(File.expand_path(File.dirname(__FILE__)), "page.rb")

module CyberDojo
  class KataEditPage < Page

    def load_completed?
      begin
        !@driver.find_element(:id => "test-button").nil?
      rescue
        false
      end
    end

    def test_button
      @wait.until { @driver.find_element(:id => "test-button") }
    end

  end
end