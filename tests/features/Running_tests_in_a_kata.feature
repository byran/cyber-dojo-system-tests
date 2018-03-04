Feature: Running tests in a kata

  Scenario: A new kata has no traffic lights
    Given I have created an individual kata
    Then there are no traffic lights

  Scenario: A traffic light is added for each test run
    Given I have created an individual kata
    When I run the tests
    Then the traffic lights are "red"
    When I edit "hiker.rb" to be
    ```
    syntax-error
    ```
    And I run the tests
    Then the traffic lights are "red,amber"
    When I edit "hiker.rb" to be
    ```
    def answer
      42
    end
    ```
    And I run the tests
    Then the traffic lights are "red,amber,green"

  Scenario: A timeout traffic light is added if a test enters an infinite loop
    Given I have created an individual kata
    When I edit "hiker.rb" to be
    ```
    def answer
      loop do
      end
    end
    ```
    And I run the tests
    Then the traffic lights are "timed_out"
