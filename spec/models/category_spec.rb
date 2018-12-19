# 067-6115145 ts
require 'rails_helper'

RSpec.describe Category, type: :model do

  let(:category) { create(:category_with_images) }
  let(:categories) { 4.times.map { build(:category) } }
  
  describe 'create categories' do
    it 'validates category name' do
      expect(category.name).not_to be_empty
    end
    it 'categories assign to user' do
      expect(category.user).not_to eq(nil)
    end
    it 'destroys dependent' do
      @user2 = categories.first.user
      expect { @user2.destroy }.to change { categories.count }.by(0) # no categories for destroyed user
    end
  end

  describe 'category assosiations' do
    it 'with user' do
      expect(category).to respond_to(:user)
    end
    it 'with images' do
      expect(category).to respond_to(:images)
    end
    it 'with images' do
      assc = described_class.reflect_on_association(:images)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'category validations' do
    context 'presense' do
      it 'when no name' do
        category = Category.new(name: nil)
        expect(category.valid?).to be false
      end
      it 'when name & user r present' do
        expect(category.valid?).to be true
      end
    end 
  end

  describe 'methods' do
    it '#top_image' do
      expect(category.top_image).to eq(category.images.order(:cached_votes_up => :desc).first)
    end 
  end

end
