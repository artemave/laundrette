Feature: create orders

  Scenario: existing customer
    Given Jon is an existing customer
    When he comes in with a brown jacket and a blue costume to clean
    And he wants it to be delivered in 3 days time
    Then Timur can create an order for him capturing all those details
    And he can link the order to the sticker number
    And he can see and abjust the order total
    And he can submit this new order

  Scenario: new customer
    Given Rob is a first timer
    When he comes in with a pair of trousers to clean
    Then Timur create a customer account for him with all his contact info
    And then create an order for that account
