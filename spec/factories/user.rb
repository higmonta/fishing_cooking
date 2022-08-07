FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '123456789aA' }
    password_confirmation { '123456789aA' }
  end
end