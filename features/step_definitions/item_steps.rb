Given /^I have \d+? items? called (.+)$/ do |items|
  items.split(', ').each do |item|
    Factory(:item, :name => item)
  end
end

Given /^I have (\d+) items? with a stock of (\d+)$/ do |num, stock|
  (1..num.to_i).each do |i|
    Factory(:item, :stock => stock)
  end
end

Given /^I have 0 items$/ do
  Item.delete_all
end

Then /^I should have (\d+) items?$/ do |num|
  Item.count == num
end

When /^I confirm the js dialog$/ do
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end