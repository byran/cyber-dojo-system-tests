Feature: Diffing in a kata

  Scenario: A diff dialog appears when a traffic light is clicked
    Given I have created an individual kata
    And I edit "hiker.rb" to be
    ```
    def answer; 49; end
    ```
    And I run the tests
    And I edit "hiker.rb" to be
    ```
    def answer; 42; end
    ```
    And I run the tests
    When I click on traffic light number 2
    Then the diff dialog is shown
    And the diff for the "hiker.rb" file is
    ```
    def answer; 49; end
    def answer; 42; end
    ```