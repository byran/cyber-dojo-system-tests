require 'selenium-webdriver'

class CyberDojoSetupDefaultStartPointPage
  def initialize(driver, wait)
    @driver = driver
    @wait = wait
  end

  def language(name)
    languagesList = @wait.until { @driver.find_element :id => "languages-list" }

    languages = @wait.until { languagesList.find_elements :class => "filename" }

    for language in languages
      if language.text == name
        return language
      end
    end

    return nil

  end
end