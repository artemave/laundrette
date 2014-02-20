Feature: complete order

  Scenario: complete order
    Given there is a new order
    When it is complete and picked up
    Then Timur can mark it complete
    And he should see that it is complete
