Feature: Viewing an Application
  Background:
    Given there is an application and task

  Scenario: I am not signed in
    Given I am on the home page
    When I visit the application
    And I click on the first application
    Then I should see the application

  Scenario: I am signed in
    Given I am authenticated
    When I am on the home page
    Then I should get redirected to the application page
    When I click on the first application
    And I should see the application
