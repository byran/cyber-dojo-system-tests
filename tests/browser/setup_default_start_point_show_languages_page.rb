require File.join(File.expand_path(File.dirname(__FILE__)), "page.rb")

class CyberDojoSetupDefaultStartPointShowLanguagesPage < CyberDojoPage

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

  def framework(name)
    frameworkList = @wait.until { @driver.find_element :id => "tests-list" }

    frameworks = @wait.until { frameworkList.find_elements :class => "filename" }

    for framework in frameworks
      if framework.text == name
        return framework
      end
    end

    return nil
  end

  def next_button
    @wait.until { @driver.find_element :id => "choose-exercise" }
  end

end