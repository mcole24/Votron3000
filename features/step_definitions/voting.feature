Feature: Logged-in user can vote for a project.
  
  Scenario: User casts a vote
    Given User is logged in
    When user views the project to vote on
    Then user will be able to click a button
    And a vote will be recorded for that user and that project