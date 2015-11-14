Feature: Person views Happy Hours
As a person
I want to see what happy hours are available
So that I can find the best one 

Background:
  Given the following happy hours: 
    | name                  | start_time   | end_time  | 
    | Legends               | 3:00PM       | 5:00PM    | 
    | Johnny's              | 1:00PM       | 2:00PM    | 
    | Bang Bang Grill       | 4:00PM       | 6:00PM    | 

Scenario: Person views happy hours alphabetically
  Given I am on the Happy Hour index page
  # And I follow "View Alphabetically"
  Then I should see the following happy hours:
  | name                  | 
  | Bang Bang Grill       | 
  | Johnny's              | 
  | Legends               | 

@time-check @wip
Scenario: Person views happy hours by what's open
  Given I am on the Happy Hour index page
  And I follow "View Open Happy Hours"
  And the current time is "4:00"
  Then I should see the following businesses:
  | name                  | 
  | Bang Bang Grill       |  
  | Legends               | 
  | Johnny's              | 
