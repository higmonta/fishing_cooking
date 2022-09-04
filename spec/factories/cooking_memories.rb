FactoryBot.define do
  factory :cooking_memory do
    association :user
    cooking_name { 'test_cooking_name' }
    fish_name { 'test_fish_name' }
    cooking_date { '2022/07/19' }
    memo { 'test_memo' }
  
    trait :attached_image do
      after(:build) do |cooking_memory|
        cooking_memory.cooking_memory_image.attach(io: File.open("#{Rails.root}/spec/fixtures/images/test1_image.jpg"), filename: 'test1_image.jpg', content_type: 'image/png/jpg')
      end
    end

    trait :another_cooking_name do
      cooking_name { 'another_cooking_name' }
    end

    trait :another_fish_name do
      fish_name { 'another_fish_name' }
    end

    trait :another_memo do
      memo { 'another_memo' }
    end
  end
end
