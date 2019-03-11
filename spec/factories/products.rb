FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::ChuckNorris.fact }
    price_cents { Faker::Number.between(100, 30000) }
  end
end
