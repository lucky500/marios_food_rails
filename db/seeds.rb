# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.destroy_all
70.times do
  Product.create!([{
    name: Faker::Food.ingredient,
    cost: 10,
    country_of_origin: Faker::Address.country
  }])
end



Review.destroy_all
product_id = Product.pluck(:id)
product_id_to_i = product_id.collect{|i| i.to_i}
270.times do
  Review.create!([{
    author: Faker::Name.name,
    content_body: Faker::Lorem.paragraph(2, true, 4),
    rating: Random.rand(1..5),
    product_id: product_id_to_i.sample
  }])
end


