Given /^I have \d+ categor(?:y|ies) called (.+)$/ do |categories|
  categories.split(', ').each do |category|
    Factory(:category, :name => category)
  end
end