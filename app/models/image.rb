class Image < ApplicationRecord
  belongs_to :category
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  before_save :update_image_attributes

  validates_processing_of :image
  validate :image_size_validatio
  
  acts_as_votable

  private
    def update_image_attributes
      if image.present?
        self.image_file_size = image.file.size	
      end
    end

    def image_size_validatio
      errors[:image] << "should be less than 1500KB" if image.size > 1.5.megabytes
    end
end
