Feature: Event Create
  As a logged-in user
  I want to manage events
  So that I can delete events

Scenario: User deletes an event
  Given I am logged in
  And an event exists
  When I delete the event
  Then I should see a message saying "Evento eliminado con éxito"
  And the event should no longer exist
