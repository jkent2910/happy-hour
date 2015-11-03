Feature: User adds a happy hour
  As a user
  I want to add a happy hour 
  So that others will know about it 

  Scenario: User adds happy hour
    Given I am a User 
    And I visit the landing page
    When I follow "Add a Happy Hour"
    Then I should be on the sign in page
    When I sign in
    Then I should be on the new business page
    When I fill in "business_name" with "Legends"
    And I select "03 PM" from "business_start_time_4i"
    And I select "05 PM" from "business_end_time_4i"
    And I fill in "Website" with "www.legendsamericangrill.com"
    And I fill in "business_address_attributes_line1" with "640 S 50th Street"
    And I fill in "City" with "West Des Moines"
    And I fill in "State" with "Iowa"
    And I fill in "Zip" with "50325"
    And I fill in "business_specials_attributes_0_name" with "Fish Tacos"
    And I select "Food" from "business_specials_attributes_0_category"
    And I fill in "Price" with "$5.00"
    And I select "Wednesday" from "business_specials_attributes_0_day_of_the_week"
    When I press "Create"
    Then I should be on the business show page
    And I should see "Business was successfully created"

  Scenario: User edits happy hour start and end times
    Given I am a User
    And I am signed in 
    And I am on the Happy Hour index page
    And I visit a business page
    And I follow "Edit Business" 
    And I select "05 PM" from "business_start_time_4i"
    And I select "06 PM" from "business_end_time_4i"
    When I press "Update"
    Then I should be on the business show page
    And I should see "Business was successfully updated"

