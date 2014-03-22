Feature: mark order paid
  Because customers may pay at any point (between order taken and complete)
  We need to remember that fact

  Scenario: mark order paid
    Given Mark has made an order
    When he pais for it
    Then Timur marks it paid
    And he should see that the order is paid

  Scenario: reset order status back to New
    Given Mark has made an order
    When Timur accidently marks it paid
    Then he can reset the status back to Unpaid
    And he should see that it is still unpaid
