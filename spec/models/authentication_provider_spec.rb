require 'rails_helper'

RSpec.describe AuthenticationProvider, type: :model do
  
  subject { described_class.new(name: 'github') }

  context 'AuthenticationProvider associations' do

    it 'with social_accounts' do
      expect(subject).to respond_to(:social_accounts)
    end
    it 'with users' do
      expect(subject).to respond_to(:users)
    end
    it 'with user_authentications' do
      expect(subject).to respond_to(:user_authentications)
    end
  end

  context 'AuthenticationProvider scope' do
    it 'when gets provider name' do
      expect(AuthenticationProvider.get_provider_name(subject.name)).not_to eq(nil)
    end
    it "when doesn't get provider name" do
      expect(AuthenticationProvider.get_provider_name('')).to be_empty
    end
  end

end
