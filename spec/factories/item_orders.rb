FactoryBot.define do
  factory :item_order do
    post_code    {'123-4567'}
    region_id  {'3'}
    municipalities      {'横浜市'}
    banchi     {'1-1-1'}
    building_name  {'建物ビル'}
    number   {'09022223333'} 
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end