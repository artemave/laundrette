Feature: notify user on due orders
  As a user
  I want to know about orders that are about to become overdue
  So that I can deal with them first

  Scenario: there is an order that should be completed tomorrow
    Given there is an order that must be done the day after tomorrow
    When tomorrow comes
    Then Timur receives an email reminder

  Scenario: there is an order overdue
