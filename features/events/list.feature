Feature: Event List
  As a logged-in user
  I want to manage events
  So that I can list

Scenario: User lists events
  Given I am logged in
  And events exist
  When I go to the events page
  Then I should see a list of events
