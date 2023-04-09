FactoryBot.define do
  factory :item do
    association :user
    
    item_name { Faker::Name.name }
    item_text { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 1, to: 10) }
    situation_id { Faker::Number.between(from: 1, to: 6) }
    delivery_fee_payment_id { Faker::Number.between(from: 1, to: 2) }
    region_id { Faker::Number.between(from: 1, to: 47) }
    deadline_id { Faker::Number.between(from: 1, to: 3) }
    price { Faker::Number.between(from: 300, to: 9_999_999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
