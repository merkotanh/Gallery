require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  let (:user) { create (:user) }
  let (:other_user) { create (:random_user) }

  describe 'Friendship #create' do
    before do
      user.follow(other_user)
      @friendship = Friendship.last
    end
    it 'follower user' do
      expect(@friendship.follower_id).to eq(user.id)
    end
    it 'followed user' do
      expect(@friendship.followed_id).to eq(other_user.id)
    end
  end

  describe 'Friendship #destroy' do
    before do
      user.follow(other_user)
      user.unfollow(other_user)
      @friendship = Friendship.last
    end
    it 'followers & followed' do
      expect(@friendship).to eq(nil)
    end
  end

end
