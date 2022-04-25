Feature: Google

Scenario: Searching for a single word in google
      Given I go to google
      When I search for "execution"
      Then the results are correct