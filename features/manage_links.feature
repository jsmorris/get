Feature: Manage links
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new link
    Given I am on the new link page
    When I fill in "Full" with "full 1"
    And I fill in "Short" with "short 1"
    And I press "Create"
    Then I should see "full 1"
    And I should see "short 1"

  Scenario: Delete link
    Given the following links:
      |full|short|
      |full 1|short 1|
      |full 2|short 2|
      |full 3|short 3|
      |full 4|short 4|
    When I delete the 3rd link
    Then I should see the following links:
      |Full|Short|
      |full 1|short 1|
      |full 2|short 2|
      |full 4|short 4|
