FactoryBot.define do
  factory :buyer_address do
    postal_code { '123-4567' }
    prefecture_id { 1 }
    city { '帯広' }
    house_number { '1-1' }
    building_name { 'JRビル' }
    phone_number { '09080008000' }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
