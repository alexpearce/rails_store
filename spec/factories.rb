Factory.define :item do |f|
  f.sequence(:name) { |n| "foo#{n}" }
  f.price '15.99'
  f.stock '50'
  f.description 'Funky description for the item.'
  f.image ' '
end

Factory.define :basket do |f|
end

Factory.define :line_item do |f|
  f.item_id '1'
  f.basket_id '1'
end