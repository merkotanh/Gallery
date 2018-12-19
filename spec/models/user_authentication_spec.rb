require 'rails_helper'

RSpec.describe UserAuthentication, type: :model do

  subject { described_class.new(token: 'token', params: 'params', authentication_provider_id: 1, user_id: 1, uid: 'uid') }

  context 'UserAuthentication associations' do
    it 'with users' do
      expect(subject).to respond_to(:user)
    end
    it 'with authentication_provider' do
      expect(subject).to respond_to(:authentication_provider)
    end
  end

end