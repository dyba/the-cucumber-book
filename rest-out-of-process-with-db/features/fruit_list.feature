Feature: Fruit List
  In order to make a great smoothie
  I need some fruit

  Scenario: List Fruit
    Given the system knows about the following fruit:
      | name        | color   |
      | banana      | yellow  |
      | strawberry  | red     |
    When the client requests GET /fruits
    Then the response should be JSON:
      """
      [
        {"name": "banana", "color": "yellow"},
        {"name": "strawberry", "color": "red"}
      ]
      """

  Scenario: Add Fruit
    Given the system knows about the following fruit:
      | name        | color   |
      | banana      | yellow  |
    When the client submits POST /fruits with the following fruit:
      | name        | color   |
      | strawberry  | red     |
    And the client requests GET /fruits
    Then the response should be JSON:
      """
      [
        {"name": "banana", "color": "yellow"},
        {"name": "strawberry", "color": "red"}
      ]
      """
