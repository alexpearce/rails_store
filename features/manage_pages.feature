Feature: Manage pages
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new page
    Given I am on the new page page
    When I fill in "Name" with "name 1"
    And I fill in "Content" with "content 1"
    And I fill in "Permalink" with "permalink 1"
    And I fill in "Links to" with "links_to 1"
    And I fill in "Order" with "order 1"
    And I fill in "Parent" with "parent_id 1"
    And I uncheck "Published"
    And I press "Create"
    Then I should see "name 1"
    And I should see "content 1"
    And I should see "permalink 1"
    And I should see "links_to 1"
    And I should see "order 1"
    And I should see "parent_id 1"
    And I should see "false"

  Scenario: Delete page
    Given the following pages:
      |name|content|permalink|links_to|order|parent_id|published|
      |name 1|content 1|permalink 1|links_to 1|order 1|parent_id 1|false|
      |name 2|content 2|permalink 2|links_to 2|order 2|parent_id 2|true|
      |name 3|content 3|permalink 3|links_to 3|order 3|parent_id 3|false|
      |name 4|content 4|permalink 4|links_to 4|order 4|parent_id 4|true|
    When I delete the 3rd page
    Then I should see the following pages:
      |Name|Content|Permalink|Links to|Order|Parent|Published|
      |name 1|content 1|permalink 1|links_to 1|order 1|parent_id 1|false|
      |name 2|content 2|permalink 2|links_to 2|order 2|parent_id 2|true|
      |name 4|content 4|permalink 4|links_to 4|order 4|parent_id 4|true|
