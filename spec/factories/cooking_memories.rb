FactoryBot.define do
  factory :cooking_memory do
    association :user
    cooking_name{ 'test_cooking_name' }
    fish_name { 'test_fish_name' }
    cooking_date { '2022/07/19' }
    memo { 'test_memo' }
  end
end
