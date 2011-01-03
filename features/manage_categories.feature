Feature: Manage Catgories
	In order to categorize items in the store
	As a store owner
	I want to create, manage and assign categories
	
	Scenario: Non-admin cannot edit categories
		Given I have 1 category called "Sport"
		When I visit the edit page for "Sport"
		Then I should see "You need to sign in or sign up before continuing"
		
	Scenario: Admins can edit categories
		Given an admin exists and I am logged in
		And I have 1 category called "Sport"
		When I visit the edit page for "Sport"
		Then I should see "Editing Category 'Sport'"
		
	Scenario: Edit category name
		Given an admin exists and I am logged in
		And I have 1 category called "Sport"
		When I visit the edit page for "Sport"
		And I fill in "Name" with "Film"
		And I press "Save"
		Then I should see "Category was successfully updated"
		And I should see "Film"
		And I should have 1 category
		
	Scenario: Create new category
		Given an admin exists and I am logged in
		And I am on the list of categories
		When I follow "New Category"
		And I fill in "Name" with "Sport"
		And I press "Save"
		Then I should see "Category was successfully created"
		And I should see "Sport"
		And I should have 1 category
	
	Scenario: Assign category to item
		Given an admin exists and I am logged in
		And I have 1 category called "Sport"
		And I have 1 item called "T-Shirt"
		And I am on the item page for "T-Shirt"
		When I follow "Edit"
		And I check "Sport"
		And I press "Save"
		Then I should see "Item successfully updated"
		And I should see "Sport"

	Scenario: Unassign category to item
		Given an admin exists and I am logged in
		And I have an item called "T-Shirt" with a category called "Sport"
		And I am on the item page for "T-Shirt"
		When I follow "Edit"
		And I uncheck "Sport"
		And I press "Save"
		Then I should see "Item successfully updated"
		And I should not see "Sport"
		And "T-Shirt" should belong to 0 categories