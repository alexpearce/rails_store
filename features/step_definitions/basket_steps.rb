Given /^I have the following items$/ do |table|
  table.hashes.each do |hash|
    Factory(:item, hash)
  end
end

Then /^I should have (\d+) baskets?$/ do |num|
  Basket.count == num
end

Then /^I should have (\d+) line items?$/ do |num|
  LineItem.count == num
end

Then /^the basket total should be "([\d.]+)"/ do |num|
  Basket.first.subtotal == num
end