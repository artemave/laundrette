Feature: complete order

  Scenario: complete order
    Given there is a new order
    When it is complete and picked up
    Then Timur can mark it complete
    And he should see that it is complete

  Scenario: reset order status back to New
    Given there is a new order
    When Timur accidently marks it complete
    Then he can reset the status back to New
    And he should see that it is still new
