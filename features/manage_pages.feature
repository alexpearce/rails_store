Feature: Manage pages
  
  Scenario: Register new page
    Given I am on the new page page
    When I fill in "Name" with "New Stuff"
    And I fill in "Content" with "Proin quis tortor orci."
    And I fill in "Permalink" with "new_stuff"
    And I fill in "Links to" with ""
    And I fill in "Order" with "10"
    And I check "Published"
    And I press "Create"
    Then I should see "New Stuff"
    And I should see "Proin quis tortor orci."

  # Scenario: Delete page
  #   Given the following pages:
  #     |name|content|permalink|links_to|order|parent_id|published|
  #     |name 1|content 1|permalink 1|links_to 1|order 1|parent_id 1|false|
  #     |name 2|content 2|permalink 2|links_to 2|order 2|parent_id 2|true|
  #     |name 3|content 3|permalink 3|links_to 3|order 3|parent_id 3|false|
  #     |name 4|content 4|permalink 4|links_to 4|order 4|parent_id 4|true|
  #   When I delete the 3rd page
  #   Then I should see the following pages:
  #     |Name|Content|Permalink|Links to|Order|Parent|Published|
  #     |name 1|content 1|permalink 1|links_to 1|order 1|parent_id 1|false|
  #     |name 2|content 2|permalink 2|links_to 2|order 2|parent_id 2|true|
  #     |name 4|content 4|permalink 4|links_to 4|order 4|parent_id 4|true|