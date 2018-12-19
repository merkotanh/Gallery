require 'rails_helper'

RSpec.describe SocialAccount, type: :model do

  let(:account) { create(:social_accounts) }

  context 'SocialAccount associations' do
    it 'with users' do
      expect(account).to respond_to(:user)
    end
    it 'with authentication_provider' do
      expect(account).to respond_to(:authentication_provider)
    end
    it 'with authentication_provider' do
      expect(account.authentication_provider.name).not_to be_empty
    end
  end

  context 'SocialAccount scope' do

    it 'when get provider account' do
      expect((SocialAccount.get_provider_account(account.user.id, account.authentication_provider.id)).ids.first).to eq(account.id)
    end
    it 'when get provider account' do
      expect(SocialAccount.get_provider_account(account.user.id, account.authentication_provider.id)).not_to be_empty
    end
    it 'when get provider name' do
      expect(SocialAccount.get_provider_name_account(account.user.id, account.authentication_provider.name)).not_to be_empty
    end
  end
  # scope :get_provider_account , -> (user_id,auth_provider_id) { where("user_id = ? and authentication_provider_id = ? ",user_id,auth_provider_id) }
  # scope :get_provider_name_account , -> (user_id,auth_provider_name) { where("user_id = ? and authentication_providers.name = ? ",user_id,auth_provider_name).joins(:authentication_provider) }
end
