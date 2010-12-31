Given /^an admin exists$/ do
  @user = Factory(:admin)
end

Given /^I am signed in as an admin$/ do
  visit new_admin_session_path
  fill_in('admin_username', :with => @user.username)
  fill_in('admin_password', :with => @user.password)
  click_button('Sign in')
end

Then /^I should see a button with a value of "([^\"]*)"$/ do |value|
  response.should have_selector("form input[value='#{value}']")
end

Then /^I should see a disabled button$/ do
  response.should have_selector("form input[disabled='disabled']")
end