Feature: Manage Items
	In order to run a store
	As a store owner
	I want to create and manage items
	
	Scenario: List Items
		Given I have items called New Album, T-Shirt
		When I go to the list of items
		Then I should see "New Album"
		And I should see "T-Shirt"
		
	Scenario: Create Valid Item
		Given I have no items
		And I am on the list of items
		When I follow "New Item"
		And I fill in "Name" with "T-Shirt"
		And I fill in "Price" with "5.99"
		And I fill in "Stock" with "35"
		And I fill in "Description" with "Some text here."
		And I fill in "Image" with "image.jpg"
		And I press "Save"
		Then I should see "New item successfully created."
		And I should see "T-Shirt"
		And I should have 1 item