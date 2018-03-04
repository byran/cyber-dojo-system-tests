Feature: Renaming a file in a kata

  Scenario: A file can be renamed
    Given I have created an individual kata
    And I edit "hiker.rb" to be
    ```
    def answer
      42
    end
    ```
    When I rename "hiker.rb" to "other.rb"
    And I run the tests
    When I rename "other.rb" to "hiker.rb"
    And I run the tests
    Then the traffic lights are "amber,green"
    # The tests have a "require './hiker'" so the code
    # should not build when the file is called other.rb
    # and should pass when the file is renamed back to
    # hiker.rb
