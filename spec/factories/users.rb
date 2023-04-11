FactoryBot.define do
  factory :user do
    nick_name { Faker::Name.name }
    family_name { '太郎' }
    first_name { '山田' }
    family_name_kana { 'タロウ' }
    first_name_kana { 'ヤマダ' }
    birth { Faker::Date.between(from: 10.days.ago, to: Date.today) }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
