Feature: Reviewing a kata with the dashboard

  Scenario: The number of tests run by an individual in a kata can be seen in the dashboard from a different browser instance
    Given an individual session with an avatar which has one failing and one passing test
    When I open a new browser
    And I open the dashboard for the session
    Then the dashboard traffic lights for the 1st participant are "red,green"

  Scenario: Multiple kata's can be seen in a sessions's dashboard
    Given the session leader has created a group session
    And I open a new browser
    And a participant has one failing and one passing test
    And another participant has one failing test
    When I open a new browser
    And I open the dashboard for the session
    Then the dashboard traffic lights for the 1st participant are "red,green"
    And the dashboard traffic lights for the 2nd participant are "red"

  @multiple-participant
  Scenario: The session leaders dashboard is updated when participants run tests
    Given the session leader has created a group session
    And 2 participants join the group session
    When participant 1 runs a failing test
    Then the session leader's dashboard traffic lights for participant 1 are "red"
    When participant 1 runs a passing test
    Then the session leader's dashboard traffic lights for participant 1 are "red,green"
    When participant 2 runs a passing test
    Then the session leader's dashboard traffic lights for participant 2 are "green"
    And the session leader's dashboard traffic lights for participant 1 are "red,green"
    When participant 2 runs a failing test
    Then the session leader's dashboard traffic lights for participant 2 are "green,red"
    And the session leader's dashboard traffic lights for participant 1 are "red,green"
