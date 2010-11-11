Given /^I have items called (.+)$/ do |items|
  items.split(', ').each do |item|
    Factory(:item, :name => item)
  end
end

Given /^I have no items$/ do
  Item.delete_all
end

Then /^I should have ([1-9]+) items?$/ do |num|
  Item.count == num
end
