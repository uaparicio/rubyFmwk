Feature: Google

@smoke @regression
Scenario: Searching for a single word in google
      Given I go to google
      When I search for "execution"
      Then the results are correct

@regression
Scenario: Scenario that fails
      Given I go to google
      When I search for "@@@"
      Then the results are correct