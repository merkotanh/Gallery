FactoryBot.define do
  
  factory :user do
    username { 'Mary' }
    email { Faker::Internet.email }
    slug { 'Mary' }
    password { '10010011' }
    password_confirmation { '10010011' }
    # association :social_accounts
  end

  factory :random_user, class: User do # используется в features private sign_in
    # id { Faker::Number.number(2) }
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Name.name }
  end

  factory :user1, class: User do |f|
    # f.sequence(:id) { |n| "#{n}" }
    f.sequence(:username) { |n| "user#{n}" }
    f.email { |a| "#{a.username}@example.com" }
    f.password {'RORD'}
    f.password_confirmation {'RORD'}
  end

end