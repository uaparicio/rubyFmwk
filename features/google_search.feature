Feature: Google

@smoke
Scenario: Searching for a single word in google
      Given I go to google
      When I search for "execution"
      Then the results are correct

Scenario: Scenario that should not run
      Given I go to google
      When I search for "it is not tagged as @smoke"
      Then the results are correct