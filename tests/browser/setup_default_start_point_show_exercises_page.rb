require File.join(File.expand_path(File.dirname(__FILE__)), "page.rb")

class CyberDojoSetupDefaultStartPointShowExercisesPage < CyberDojoPage

  def exercise(name)
    exercisesList = @wait.until { @driver.find_element :id => "exercises-list" }

    exercises = @wait.until { exercisesList.find_elements :class => "filename" }

    for exercise in exercises
      if exercise.text == name
        return exercise
      end
    end

    return nil

  end

  def set_it_up_button
    @wait.until { @driver.find_element :id => "create-it" }
  end

  # Enter dojo dialog
  def dojo_id
    @wait.until { @driver.find_element :id => "dojo-id" }
  end

  def enter_page_button
    @wait.until { @driver.find_element :class => "enter-page" }
  end

  def start_coding_button
    @wait.until { @driver.find_element :class => "start-coding" }
  end

  # Start coding dialog
  def avatar_image
    @wait.until { @driver.find_element :class => "avatar_image" }
  end

  def ok_button
    buttons = @wait.until { @driver.find_elements :class => "ui-button-text" }

    index = buttons.find_index { |b| b.text == "ok" }

    buttons[index]
  end

end