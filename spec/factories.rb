Factory.define :item do |f|
  f.sequence(:name) { |n| "foo#{n}" }
  f.price '15.99'
  f.stock '50'
  f.description 'Funky description for the item.'
end

Factory.define(:category_with_item, :parent => :category) do |f|
  f.item_id = 1
end

Factory.define :basket do |f|
end

Factory.define :line_item do |f|
end

Factory.define :admin do |f|
  f.username 'admin'
  f.email 'alex@alexpearce.me'
  f.password 'admin123'
  f.password_confirmation 'admin123'
end

Factory.define :category do |f|
  f.sequence(:name) { |n| 'Category #{n}'}
end