FactoryBot.define do
  factory :purchase_delivery do
    user_id                 { FactoryBot.create(:user) }
    item_id                 { FactoryBot.create(:item) }
    token                  { "tok_abcdefghijk00000000000000000" }
    post_code              { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id          { Faker::Number.between(from: 2, to: 48) }
    city                   { Faker::Address.city }
    address                { Faker::Address.street_address }
    building_name          { Faker::Address.building_number }
    telephone_number       { Faker::Number.number(digits: Faker::Number.between(from: 10, to: 11)) }
  end
end