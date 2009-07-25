Feature: Manage urls
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new url
    Given I am on the new url page
    When I fill in "Short" with "short 1"
    And I fill in "Full" with "full 1"
    And I press "Create"
    Then I should see "short 1"
    And I should see "full 1"

  Scenario: Delete url
    Given the following urls:
      |short|full|
      |short 1|full 1|
      |short 2|full 2|
      |short 3|full 3|
      |short 4|full 4|
    When I delete the 3rd url
    Then I should see the following urls:
      |Short|Full|
      |short 1|full 1|
      |short 2|full 2|
      |short 4|full 4|
