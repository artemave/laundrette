Feature: customer lookup
  So that we don't waste time getting customer info over and over again
  And also so we can keep track of individual customer offers, etc.
  There should be a way to lookup customer details and past orders

  Scenario: 
    Given Sarah has previously used our service
    When she comes one day and wants to clean a coat
    Then Timur can see her contact info
    And he can also view her past orders
