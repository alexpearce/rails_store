Given /^I have \d+ categor(?:y|ies) called "(.+)"$/ do |categories|
  categories.split(', ').each do |category|
    Factory(:category, :name => category)
  end
end

When /^I visit the edit page for "(.+)"$/ do |category_name|
  visit edit_category_path(Category.find_by_name(category_name))
end

Then /^I should have (\d+) categor(?:y|ies)$/ do |num|
  Category.all.count == num
end

Then /^"(.+)" should belong to (\d+) categor(?:y|ies)$/ do |item_name, num|
  item = Item.find_by_name(item_name)
  item.categories.count == num
end