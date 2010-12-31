Feature: Manage Items
	In order to browse
	As a user
	I want to be able to view and purchase items
	
	Scenario: Item index on home page
		Given I have 3 items called "T-Shirt", "Poster", "CD"
		When I am on the home page
		Then I should see "T-Shirt"
		And I should see "Poster"
		And I should see "CD"
		
	Scenario: Sold out button on items with zero stock
		Given I have 1 item with a stock of 0
		When I am on the first item page
		Then I should see a button with a value of "Sold Out"
		And I should see a disabled button
	
	Scenario: Add to basket button on items with gt zero stock
		Given I have 1 item with a stock of 10
		When I am on the first item page
		Then I should see a button with a value of "Add to Basket"