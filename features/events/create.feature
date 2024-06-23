Feature: Event Create
  As a logged-in user
  I want to manage events
  So that I can create events

Scenario: User creates an event
  Given I am logged in
  And I am on the new event page
  When I fill in the event form with valid data
  And I submit the form "Crear Evento"
  Then I should see a message saying "Evento creado con éxito"
  And I should see the event details
