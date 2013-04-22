Feature: Cash withdrawal
  Scenario: Successful withdrawal from an account in credit
    Given I am credited $100 in my account
    When I prompt the teller to withdraw $20 from my account
    Then $20 should be dispensed
    And the balance of my account should be $80
