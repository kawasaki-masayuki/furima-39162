FactoryBot.define do
  factory :item do

    product_name           { Faker::Commerce.product_name }
    explanation            { Faker::Lorem.sentence }
    category_id            { Faker::Number.between(from: 2, to: 11) }
    commodity_condition_id { Faker::Number.between(from: 2, to: 7) }
    shipping_charge_id     { Faker::Number.between(from: 2, to: 3) }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    delivery_date_id       { Faker::Number.between(from: 2, to: 4) }
    price                  { Faker::Number.between(from: 300, to: 9999999) }
    user                   { FactoryBot.create(:user) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
