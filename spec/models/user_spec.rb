require 'rails_helper'

RSpec.describe User, type: :model do
  
  subject {
    described_class.new(email: 'new-email@dot.com', 
                        username: 'name',
                        password: '00011100',
                        password_confirmation: '00011100',
                        avatar: 'avatar',
                        slug: 'name'
                        )
  }

  context 'User validation' do
    let(:user_with_same_email) { create(:user) } # user_with_same_email = subject.dup

    it 'when it is valid' do
      expect(subject).to be_valid
    end
    it 'with no email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    it 'with no password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
    it 'with no password_confirmation' do
      subject.password_confirmation = ''
      expect(subject).to_not be_valid
    end
    it 'with different password & password_confirmation' do
      subject.password_confirmation = '000'
      expect(subject).to_not be_valid
    end
    it 'when email address is already taken' do
      # user_with_same_email.email = subject.email
      # expect(user_with_same_email.valid?).to eq(false)
    end
  end

  context 'User associations' do
    it 'with user_authentications' do
      expect(subject).to respond_to(:user_authentications)
    end
    it 'with categories' do
      expect(subject).to respond_to(:categories)
    end
    it 'with comments' do
      expect(subject).to respond_to(:comments)
    end
    it 'with active_friendships' do
      expect(subject).to respond_to(:active_friendships)
    end
    it 'with following' do
      expect(subject).to respond_to(:following)
    end
    it 'with passive_friendships' do
      expect(subject).to respond_to(:passive_friendships)
    end
    it 'with followers' do
      expect(subject).to respond_to(:followers)
    end
    it 'with categories' do
      assc = described_class.reflect_on_association(:categories)
      expect(assc.macro).to eq :has_many
    end
    it 'with images though category' do
      expect(subject).to respond_to(:images)
    end
  end

  describe 'Following after other_user' do
    let(:other_user) { create(:random_user) }
    before do
      subject.save
      subject.follow(other_user)
    end
    it 'when user is following' do
      expect(subject.following).not_to eq(nil)
    end
    it 'when user is following' do
      expect(subject.following?(other_user)).to eq(true)
    end
    it 'when user is following' do
      subject.unfollow(other_user)
      expect(subject.following).to eq([])
    end
    it 'when user unfollow' do
      subject.unfollow(other_user)
      expect(subject.following?(other_user)).to eq(false)
    end
  end

  describe 'Add slug to user' do
    it 'add user_slug eq to subjectname' do
      slug = subject.slug_add
      expect(slug.first).to eq(:username)
    end
  end

end
