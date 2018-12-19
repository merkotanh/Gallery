require 'rails_helper'

RSpec.describe Friendship, type: :model do

  let(:follower) { create(:random_user) }
  let(:followed) { create(:random_user) }
  let(:relationship) { follower.active_friendships.create(followed_id: followed.id) }

  subject { relationship }

  describe 'Friendship associations' do
    it 'with follower' do
      expect(subject).to respond_to(:follower)
    end
    it 'with followed' do
      expect(subject).to respond_to(:followed)
    end
  end
  
  describe 'Friendship validation' do
    before { relationship.save }
    it 'when is valid' do
      expect(relationship.valid?).to eq(true)
    end
    it 'when followed id is present' do
      expect(relationship.followed_id).not_to eq(nil)
    end
    it 'when follower id is present' do
      expect(relationship.follower_id).not_to eq(nil)
    end
    it 'when followed id is not present' do
      relationship.followed_id = nil
      expect(relationship).to_not be_valid
    end
    it 'when follower id is not present' do
      relationship.follower_id = nil
      expect(relationship).to_not be_valid
    end
  end
end
