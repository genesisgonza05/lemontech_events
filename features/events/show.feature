Feature: Event Show
  As a logged-in user
  I want to manage events
  So that I can view

Scenario: User views an event
  Given I am logged in
  And an event exists
  When I go to the event page
  Then I should see the event details
