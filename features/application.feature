Feature: Create application
  As an User
  I want to apply
  
 Scenario: apply 
    Given I am on the login page
    #Then I should see "Log in"
    When I fill logged into the login panel
    When I am on user page#/users/1
    Then I should see "Create application form"