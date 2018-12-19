FactoryBot.define do

  factory :category, class: Category do
    name { 'name' }

    association :user, factory: :user

    factory :category_with_images, class: Category do
      after(:create) do |category|
        create_list(:image2, 2, category: category)
      end
    end
  end

  factory :category1, class: Category do
    # id { 6 }
    user_id { 20 }
    name {'category_name'}
  end

  factory :categories, class: Category do |f|
    association :user, factory: :user
    # f.sequence(:id) { |n| "#{n}" }
    f.sequence(:name) { |n| "name#{n}" }
  end

end
