
FactoryBot.define do

  factory :image2, class: Image do
    image_title { 'image_2_title' }
    image_file_size { 'image_file_size' }
    image_description { 'image_description' }
    cached_votes_up { Faker::Number.number(1) }
    after :create do |b|
      b.update_column(:image, "animals.jpg")
    end
    association :category, factory: :category
  end

  factory :image_nil, class: Image do
    image_title { 'image_title' }
    image_file_size { 'image_file_size' }
    image_description { 'image_description' }
  end


  factory :random_images, class: Image do
    # category_id { 1 }
    id { Faker::Number.number(2) }
    image { Faker::Name.name }
    image_title { Faker::Name.name }
    image_file_size { Faker::Number.number(2) }
    image_description { 'image_description' }
    cached_votes_total { 5 }
    cached_votes_score { 5 }
    cached_votes_up { 5 }
    cached_votes_down { 0 }
  end

  factory :image1, class: Image do
    # id { 1 }
    category_id { 1 }
    image { 'image' }
    image_title { 'image_title' }
    image_file_size { 500 }
    image_description { 'image_description' }
    cached_votes_total { 5 }
    cached_votes_score { 5 }
    cached_votes_up { 5 }
    cached_votes_down { 0 }
  end

  factory :images, class: Image do |f|
    f.sequence(:id) { |n| "#{n+5}" }
    f.sequence(:image_title) { |n| "title#{n}" }
    image { 'image' }
    image_file_size { 500 }
    image_description { 'image_description' }
    cached_votes_up { 5 }
    f.category_id { 1 }
  end


end
