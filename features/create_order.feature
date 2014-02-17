Feature: create orders

  @javascript
  Scenario: existing customer
    Given Jon is an existing customer
    When he comes in with a brown jacket and a costume to clean
    And he wants it to be delivered in 3 days time
    Then Timur can create an order for him capturing all those details
    And he can link the order to the sticker number
    And he can see the order total
    And he can save this new order

  Scenario: new customer
    Given Rob is a first timer
    When he comes in with a pair of trousers to clean
    Then Timur creates a customer account for him with all his contact info
    And then creates an order for his account
