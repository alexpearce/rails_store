Given /^I have items called (.+)$/ do |items|
  items.split(', ').each do |item|
    Factory(:item, :name => item)
  end
end
