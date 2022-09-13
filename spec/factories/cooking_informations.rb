FactoryBot.define do
  factory :cooking_information do
    association :cooking
    association :fish
    association :handle
    association :cookware
    cooking_time { rand(100) }
    cooking_url { Faker::Internet.url }
    rest_fish_time { rand(100) }
    cooking_total_time { rand(100) }
  end
end
