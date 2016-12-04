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

end