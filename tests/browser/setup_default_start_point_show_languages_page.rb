require File.join(File.expand_path(File.dirname(__FILE__)), "page.rb")

class CyberDojoSetupDefaultStartPointShowLanguagesPage < CyberDojoPage

  def select_language(name)
    language = @wait.until { find_item_in_cyber_dojo_list(@driver, "languages-list", name) }
    language.click
  end

  def select_framework(name)
    framework = @wait.until { find_item_in_cyber_dojo_list(@driver, "tests-list", name) }
    framework.click
  end

  def next_button
    @wait.until { @driver.find_element :id => "choose-exercise" }
  end

end