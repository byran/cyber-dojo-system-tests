require File.join(File.expand_path(File.dirname(__FILE__)), "page.rb")

module CyberDojo
  class SetupDefaultStartPointShowLanguagesPage < Page

    def select_language(name)
      language = @wait.until { CyberDojo::find_item_in_cyber_dojo_list(@driver, "languages-list", name) }
      language.click
    end

    def select_framework(name)
      framework = @wait.until { CyberDojo::find_item_in_cyber_dojo_list(@driver, "tests-list", name) }
      framework.click
    end

    def next_button
      @wait.until { @driver.find_element :id => "choose-exercise" }
    end

    end
end
