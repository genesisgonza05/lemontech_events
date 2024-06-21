Feature: User Registration
  As a visitor
  I want to register
  So that I can access the application

  Scenario: User registers successfully
    Given I am on the registration page
    When I fill in the registration form with valid data
    And I submit the form 'Registrar'
    Then I should see a message saying "Te registraste correctamente."
