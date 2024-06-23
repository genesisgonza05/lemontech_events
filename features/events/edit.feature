Feature: Event Edit
  As a logged-in user
  I want to manage events
  So that I can edit

Scenario: User edits an event
  Given I am logged in
  And an event exists
  When I go to the edit event page
  And I fill in the event form with valid data
  And I submit the form "Editar Evento"
  Then I should see a message saying "Evento actualizado con éxito"
  And I should see the updated event details
