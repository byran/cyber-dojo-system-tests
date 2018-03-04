Feature: Joining a kata

  Scenario: Joining a group kata
    Given the session leader has created a group kata
    When I navigate to the home page
    And I click the "We're in a group" button
    And I click the "join" button
    And I enter and confirm the group kata's id
    And I switch to the editor window
    Then I am in the group kata
    And I have been assigned a valid avatar
