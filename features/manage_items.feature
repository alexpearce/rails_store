Feature: Manage Items
	In order to run a store
	As a store owner
	I want to create and manage items
	
	Scenario: List Items
		Given I have items called New Album, T-Shirt
		When I go to the list of items
		Then I should see "New Album"
		And I should see "T-Shirt"