Feature: Renaming a file in a kata

  Scenario: A file can be renamed
    Given I have created an individual kata
    When I edit "cyber-dojo.sh" to be
    ```
    ls -1
    ```
    And I rename "hiker.rb" to "renamed.rb"
    And I run the tests
    Then there is a "renamed.rb" line in the test output
    And there is no "hiker.rb" line in the test output


  Scenario: A file can be renamed back to its previous name
    Given I have created an individual kata
    When I edit "cyber-dojo.sh" to be
    ```
    ls -1
    ```
    And I rename "hiker.rb" to "renamed.rb"
    And I rename "renamed.rb" to "hiker.rb"
    And I run the tests
    Then there is a "hiker.rb" line in the test output
    And there is no "renamed.rb" line in the test output
