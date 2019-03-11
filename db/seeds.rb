# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = %w(
  men
  women
  accessories
  organic
  natural
  makeup
)

categories.each do |category|
  Category.create(name: category)
end

100.times do
  product = Product.create({
    price_cents: Faker::Number.between(100, 30000),
    name: Faker::Commerce.product_name,
    description: Faker::ChuckNorris.fact,
  })

  category_ids = Category.pluck(:id)
  product.product_categories.create(category_id: category_ids.sample)
end
