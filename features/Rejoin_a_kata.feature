Feature: Rejoin a kata

  Scenario: A previously created kata can be rejoined
    Given I have created an individual kata
    And I open a new browser
    When I navigate to the individual rejoin page
    And I enter my previous kata id
    And I select my previous avatar
    And I switch to my new editor window
    Then I am in my previous kata as my previous avatar
