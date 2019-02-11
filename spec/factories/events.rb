FactoryBot.define do
  factory :event do
    start_date { Time.now + 1.day }
    duration { rand(1..24)*5 }
    title { Faker::Lorem.characters(15)}
    description { Faker::Lorem.characters(40) }
    price { Faker::Number.number(3) }
    location { Faker::Address.city }
    admin { FactoryBot.create(:user) }
  end
end
