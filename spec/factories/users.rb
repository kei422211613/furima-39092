FactoryBot.define do
  factory :user do
    nick_name {Faker::Name.last_name}
    family_name {Faker::Name.last_name}
    first_name {Faker::Name.last_name}
    family_name_kana {Faker::Name.last_name}
    first_name_kana {Faker::Name.last_name}
    birth {Faker::Date.between(from: 10.days.ago, to: Date.today)}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
  end
end