Feature: User Logout
  As a logged-in user
  I want to log out
  So that I can end my session

  Scenario: User logs out successfully
    Given I am logged in
    When I click the logout link
    Then I should see a message saying "Debes iniciar sesión o registrarte para continuar"
