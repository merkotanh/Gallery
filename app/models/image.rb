class Image < ApplicationRecord
  acts_as_votable
  belongs_to :category
  has_many :comments, dependent: :destroy

  mount_uploader :image, ImageUploader

  before_save :update_image_attributes

  validates_processing_of :image
  validate :image_size_validatio

  private
    def update_image_attributes
      if image.present? # && image.changed?
      #  self.image_content_type = image.file.image_content_type
        self.image_file_size = image.file.size	
      end
    end

    def image_size_validatio
      errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
    end
end
