Feature: Creating a kata

  Scenario: Creating a kata for an individual
    Given I navigate to the home page
    When I click the "I'm on my own" button
    And I click the "create new session" button
    And I select the "Ruby, MiniTest" language and unit test framework
    And I select the "(Verbal)" exercise
    And I confirm my language/framework/exercise selection
    And I acknowledge my session id
    And I switch to the editor window
    Then I am in the kata I've just created

  Scenario: Creating a kata for a group of people
    Given I navigate to the home page
    When I click the "We're in a group" button
    And I click the "create new session" button
    And I select the "Ruby, MiniTest" language and unit test framework
    And I select the "(Verbal)" exercise
    And I confirm my language/framework/exercise selection
    And I acknowledge the groups session id
    Then I am viewing a dashboard for the kata I've just created
