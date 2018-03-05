Feature: Reviewing a kata with the dashboard

  Scenario: The number of tests run by an individual in a kata can be seen in the dashboard from a different browser instance
    Given an individual session with an avatar which has one failing and one passing test
    When I open a new browser
    And I open the dashboard for the session
    Then the dashboard traffic lights for the 1st participant are "red,green"

  Scenario: Multiple kata's can be seen in a sessions's dashboard
    Given the session leader has created a group kata
    And a participant has one failing and one passing test
    And another participant has one failing test
    When I open a new browser
    And I open the dashboard for the session
    Then the dashboard traffic lights for the 1st participant are "red,green"
    And the dashboard traffic lights for the 2nd participant are "red"
