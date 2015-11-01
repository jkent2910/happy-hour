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