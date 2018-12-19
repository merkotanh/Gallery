FactoryBot.define do
  
  factory :user3 do
    id { 3 }
    username { 'User3' }
    email { 'joe@gmail.com' }
    password { 'blah' }
    password_confirmation { 'blah' }
  end
  
  factory :user4, class: User do
    id { 4 }
    username { 'User4' }
    email { 'mary@gmail.com' }
    password { '10010011' }
    password_confirmation { '10010011' }
  end

  factory :friendship34, class: Friendship do
    id { 1 }
    follower_id { 3 }
    followed_id { 4 }
  end

end