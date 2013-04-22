Feature: Prevent users from going overdrawn

  Scenario: User tries to withdraw more than their balance
    Given my account has been credited with $100
    When I prompt the teller to withdraw $200 from my account
    Then nothing should be dispensed
    And the balance of my account should be $100
    And I should be told that I have insufficient funds in my account
