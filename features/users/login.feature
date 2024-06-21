Feature: User Login
  As a registered user
  I want to log in
  So that I can access my account

  Scenario: User logs in successfully
    Given I am a registered user
    And I am on the login page
    When I fill in the login form with valid credentials
    And I submit the form 'Ingresar'
    Then I should see a message saying "Iniciaste sesión correctamente."
