FactoryBot.define do
  factory :cooking_memory do
    trait :attached_image do
      association :user
      sequence(:cooking_name) { |n| "test_cooking_name_#{n}" }
      sequence(:fish_name) { |n| "test_fish_name_#{n}" }
      cooking_date { '2022/07/19' }
      sequence(:memo) { |n| "test_memo_#{n}" }
      after(:build) do |cooking_memory|
        cooking_memory.cooking_memory_image.attach(io: File.open("#{Rails.root}/spec/fixtures/images/test1_image.jpg"), filename: 'test1_image.jpg', content_type: 'image/png/jpg')
      end
    end

    trait :not_attached_image do
      association :user
      sequence(:cooking_name) { |n| "test_cooking_name_#{n}" }
      sequence(:fish_name) { |n| "test_fish_name_#{n}" }
      cooking_date { '2022/07/19' }
      sequence(:memo) { |n| "test_memo_#{n}" }
    end
  end
end
