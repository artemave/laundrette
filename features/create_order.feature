Feature: create orders

  Scenario: existing customer
    Given Jon is an existing customer
    When he comes in with a brown jacket and a blue costume to clean
    And he wants it to be delivered
    Then Timur can create an order for him capturing all those details
    And he can calculate the order total

  Scenario: new customer
    Given Rob is a first timer
    When he comes in with a pair of trousers to clean
    Then Timur create a customer account for him with all his contact info
    And then create an order for that account
