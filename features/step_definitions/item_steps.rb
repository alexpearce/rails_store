Given /^I have items called (.+)$/ do |items|
  items.split(', ').each do |item|
    Factory(:item, :name => item)
  end
end

Given /^I have no items$/ do
  Item.delete_all
end

Then /^I should have (\d+) items?$/ do |num|
  Item.count == num
end

When /^I confirm the js dialog$/ do
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end