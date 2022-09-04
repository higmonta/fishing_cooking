FactoryBot.define do
  factory :cooking_memory do
    trait :attached_image do
      association :user
      sequence(:cooking_name, 'test_cooking_name_1')
      sequence(:fish_name, 'test_fish_name_1')
      cooking_date { '2022/07/19' }
      sequence(:memo, 'test_memo_1')
      after(:build) do |cooking_memory|
        cooking_memory.cooking_memory_image.attach(io: File.open("#{Rails.root}/spec/fixtures/images/test1_image.jpg"), filename: 'test1_image.jpg', content_type: 'image/png/jpg')
      end
    end

    trait :attached_image_another_cooking_name do
      association :user
      sequence(:cooking_name, 'another_cooking_name_1')
      sequence(:fish_name, 'test_fish_name_1')
      cooking_date { '2022/07/19' }
      sequence(:memo, 'test_memo_1')
      after(:build) do |cooking_memory|
        cooking_memory.cooking_memory_image.attach(io: File.open("#{Rails.root}/spec/fixtures/images/test1_image.jpg"), filename: 'test1_image.jpg', content_type: 'image/png/jpg')
      end
    end

    trait :attached_image_another_fish_name do
      association :user
      sequence(:cooking_name, 'test_cooking_name_1')
      sequence(:fish_name, 'another_fish_name_1')
      cooking_date { '2022/07/19' }
      sequence(:memo, 'test_memo_1')
      after(:build) do |cooking_memory|
        cooking_memory.cooking_memory_image.attach(io: File.open("#{Rails.root}/spec/fixtures/images/test1_image.jpg"), filename: 'test1_image.jpg', content_type: 'image/png/jpg')
      end
    end

    trait :attached_image_another_memo do
      association :user
      sequence(:cooking_name, 'test_cooking_name_1')
      sequence(:fish_name, 'test_fish_name_1')
      cooking_date { '2022/07/19' }
      sequence(:memo, 'another_memo_1')
      after(:build) do |cooking_memory|
        cooking_memory.cooking_memory_image.attach(io: File.open("#{Rails.root}/spec/fixtures/images/test1_image.jpg"), filename: 'test1_image.jpg', content_type: 'image/png/jpg')
      end
    end

    trait :not_attached_image do
      association :user
      sequence(:cooking_name, 'test_cooking_name_1')
      sequence(:fish_name, 'test_fish_name_1')
      cooking_date { '2022/07/19' }
      sequence(:memo, 'test_memo_1')
    end
  end
end
