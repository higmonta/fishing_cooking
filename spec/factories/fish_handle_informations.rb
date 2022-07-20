FactoryBot.define do
  factory :fish_handle_information do
    association :fish
    association :handle
    handle_time { rand(100) }
    handle_url { Faker::Internet.url }
  end
end
