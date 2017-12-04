Feature: Create application
  As an User
  I want to register

  Scenario: Create application shown
    Given I am on the home page
    Then I should see "Apply Now!"
    #And I should see "My !"
    
  Scenario: Login 
    Given I am on the login page
    Then I should see "Log in"
    When I fill logged into the login panel
    
   # Then I should see "Log in"
    
    #When I fill in the following:
     #fill_in 'session_email', :with => 'admin'
    # fill_in 'session_email', :with => 'aaaaaaaa'
     #| session_email | cucumbertest@tamu.edu       |
     #| session_password| 1234 |
