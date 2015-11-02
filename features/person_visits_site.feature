Feature: Person visits site
  As a person
  I visit the Happy Hour website 
  So I can find or add a Happy Hour 

  Scenario: Person views home page 
    Given I am anybody 
    And I visit the landing page 
    Then I should be on the landing page 
    And I should see "Add a Happy Hour" 
    And I should see "Find a Happy Hour"

  Scenario: Person views happy hours
    Given I am anybody
    And I visit the landing page 
    And I follow "Find a Happy Hour"
    Then I should be on the Happy Hour index page

  Scenario: Person signs in
    Given I am a User
    And I visit the landing page
    When I sign in
    Then I should be on the landing page
    And I should see "Signed in successfully"

  Scenario: Person adds a happy hour before signing in
    Given I am anybody
    And I visit the landing page 
    And I follow "Add a Happy Hour" 
    Then I should be on the sign in page 
    And I should see "You need to sign in or sign up before continuing"