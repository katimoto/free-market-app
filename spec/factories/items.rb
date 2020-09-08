FactoryBot.define do
  factory :item do
    name              { Faker::Name.name }
    price             { rand(300..9999999) }
    category_id       { rand(2..11) }
    deliv_fee_id      { rand(2..3) }
    status_id         { rand(2..7) }
    address_id        { rand(2..48) }
    shipment_id       { rand(2..4) }
    text              { Faker::Lorem.sentence }
    association :user
  end
end
