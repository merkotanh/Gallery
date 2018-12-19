FactoryBot.define do
  
  factory :social_accounts, class: SocialAccount do
    token { 'token' }
    secret { 'secret' }
    association :user, factory: :user
    association :authentication_provider, factory: :providers
  end

end