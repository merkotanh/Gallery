class Category < ApplicationRecord
  belongs_to :user
  has_many :images, dependent: :destroy
  validates :name, presence: true#, uniqueness: true

  def top_image
    images.order(:cached_votes_up => :desc).first
  end

  def find_followers(user)
    u = User.find_by id: user.followers.ids[0] if user.followers.ids.any?
    MyMailer.with(user: u).welcome_email.deliver_now
  end

end
