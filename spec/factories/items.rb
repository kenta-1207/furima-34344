FactoryBot.define do
  factory :item do
    name               {'test'}
    description        {'test_description'}
    category_id        { 2 }
    item_status_id     { 2 }
    delivery_charge_id { 2 }
    prefecture_id      { 2 }
    shipping_day_id    { 2 }
    price              { 1234 }
    association :user
    
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_imsge.png')
    end
  end
end
