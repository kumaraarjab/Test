
Feature: schedule lab resources
  As a lab user I want to book a resource at least 4 weeks in advance, so that I can commit on my testing schedules.

  Scenario: look up resources
    Given I am logged in on the lab management system
    When I click on a resource type
    And I enter a start and end date for resource availability
    Then I want to see which resources of the selected type are available within the selected timeframe
    
    Scenario: book resource in advance
      Given a resource is available at the requested timeslot
      When I click on "book resource"
      Then the lab management system shall mark this resource as booked for me
      And not show it unavailable for other users
      
      Scenario: resource not available
        Given I have checked a resource availaility
        And the resources has been shown available
        When another user at the same time submits a booking for my requested timeframe
        And I click on "book resource"
        Then the lab management system shall show an approriate message that the resource has been booked recently.
        And switch back to availability view with updated data
        
