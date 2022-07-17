FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '12345aA' }
    password_confirmation { '12345aA' }
  end
end