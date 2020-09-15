FactoryBot.define do
  factory :card_buyer do
    zip { '123-4567' }
    address_id { 12}
    city { '東京都' }
    address { '1-1' }
    buildname { '東京ハイツ' }
    phonecall {"08012345678"}
  end
end