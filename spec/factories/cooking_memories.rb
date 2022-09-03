FactoryBot.define do
  factory :cooking_memory do
    trait :attached_image do
      association :user
      sequence(:cooking_name, 'test_cooking_name_1')
      sequence(:fish_name, 'test_fish_name_1')
      sequence(:cooking_date, '2022/07/19')
      sequence(:memo, 'test_memo_1')
      after(:build) do |cooking_memory|
        cooking_memory.cooking_memory_image.attach(io: File.open("#{Rails.root}/spec/fixtures/images/test1_image.jpg"), filename: 'test1_image.jpg', content_type: 'image/png/jpg')
      end
    end

    trait :not_attached_image do
      association :user
      sequence(:cooking_name, 'test_cooking_name_1')
      sequence(:fish_name, 'test_fish_name_1')
      sequence(:cooking_date, '2022/07/19')
      sequence(:memo, 'test_memo_1')
    end
  end
end
