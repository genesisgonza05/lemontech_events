Feature: User Profile Management
  As a user
  I want to manage my profile
  So that I can keep my information up to date

  Scenario: User updates profile
    Given I am logged in
    And I am on the profile page
    When I update the profile form with valid data
    And I submit the form
    Then I should see a message saying "Profile updated successfully."
