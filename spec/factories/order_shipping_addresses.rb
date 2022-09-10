FactoryBot.define do
  factory :order_shipping_address do
    postal_code { '123-4567' }
    area_id     { Faker::Number.between(from: 2, to: 48) }
    city        { '新宿区' }
    address     { '1-1' }
    building    { '東京ビル101' }
    tel         { '01234567890' }
    token       { 'tok_abcdefghijk00000000000000000' }
  end
end
