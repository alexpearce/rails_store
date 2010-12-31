Given /^an admin exists$/ do
  @user = Factory(:admin)
end

Given /^I am signed in as an admin$/ do
  visit new_admin_session_path
  fill_in('admin_username', :with => @user.username)
  fill_in('admin_password', :with => @user.password)
  click_button('Sign in')
end