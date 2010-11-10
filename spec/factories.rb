Factory.define :item do |f|
  f.sequence(:name) { |n| "foo#{n}" }
  f.price '15.99'
  f.stock '50'
  f.description 'Funky description for the item.'
  f.image 'image.jpg'
end