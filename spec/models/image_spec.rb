require 'rails_helper'

RSpec.describe Image, type: :model do

    let(:user) { build(:user) } # <-- User.new
    let(:category) { build(:category1) }
    let(:image) { build(:image2) }

  describe 'image assosiations' do
    it 'with category' do
      expect(image).to respond_to(:category)
    end
    it 'with category' do
      assc = described_class.reflect_on_association(:category)
      expect(assc.macro).to eq :belongs_to
    end
    it 'ensures image assigns to category' do
      expect(image.category_id).not_to eq(category.id)
    end
    it 'with comments' do
      expect(image).to respond_to(:comments)
    end
    it 'with comments has_many' do
      assc = described_class.reflect_on_association(:comments)
      expect(assc.macro).to eq :has_many
    end
  end

  describe 'image validations' do
    it 'ensures image size < 5000' do
      expect(image.image_file_size.to_i).to be <= 5000
    end
    it 'when no image' do
      expect(FactoryBot.build :image_nil).not_to be_valid
    end
    it 'with image' do
      expect(image.valid?).to be true
    end
    it 'validates image title' do
      expect(image.image_title).not_to be_empty
    end
    it 'validates image' do
      expect(image.image).not_to eq(nil)
    end

  end

end
