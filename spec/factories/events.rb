FactoryBot.define do
  factory :event do
    start_date { Time.now + 1.day }
    #duration { %5 == 0 }
    #title { Faker::Lorem.characters(25)}
    #description { Faker::Lorem.characters(25) }
    #price { Faker::Number.number(3) }
    #location { Faker::Address.city }
  end
end
