@tag
Feature: Typing

  @debug
  Scenario: User write name
    Given I type 'Toshi Ossada'
    When I stop tapping
    Then I expect the text "Olá Toshi Ossada"
