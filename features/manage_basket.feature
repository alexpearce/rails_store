Feature: Manage Items
	In order to buy items
	As a user
	I want to add and remove items in a basket
	
	Scenario: Add Item to Basket
		Given I have the following items
			| name     | price|
			| New Album| 3.99 |
			| T-Shirt  | 5.99 |
		And I am on the item page for "New Album"
		When I press "Add to Basket"
		Then I should see "Basket updated"
		And I should have 1 basket
		And I should have 1 line item
		
	Scenario: Add More Than One of the Same Item to Basket
		Given I have the following items
			| name     | price|
			| New Album| 3.99 |
			| T-Shirt  | 5.99 |
		And I am on the item page for "New Album"
		When I press "Add to Basket"
		And I press "Add to Basket"
		Then I should see "Basket updated"
		And I should see "x2"
		And the basket total should be "7.98"
		And I should have 1 basket
		And I should have 1 line items
		
	Scenario: List Basket
		Given I have the following items
		| name     | price|
		| New Album| 3.99 |
		| T-Shirt  | 5.99 |
		And I am on the item page for "New Album"
		And I press "Add to Basket"
		And I go to the item page for "T-Shirt"
		And I press "Add to Basket"
		And I follow "Shopping Basket"
		Then I should see "New Album"
		And I should see "T-Shirt"
		And I should see "Basket"
		And I should see "9.98"