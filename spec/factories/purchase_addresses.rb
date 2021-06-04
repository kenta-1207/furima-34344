FactoryBot.define do
  factory :purchase_address do
    postal_code {'111-1111'}
    prefecture_id { 2 }
    municipalities {'テスト'}
    address { '1' }
    building_name {'テスト'}
    phone_number {'11111111111'}
    token {'aaa'}
  end
end
