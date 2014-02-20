Feature: mark order paid
  Because customers may pay at any point (between order taken and complete)
  We need to remember that fact

  Scenario: mark order paid
    Given Mark has made an order
    When he pais for it
    Then Timur marks it paid
    And he should see that the order is paid
