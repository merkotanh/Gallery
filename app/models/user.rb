class User < ApplicationRecord
  include OmniauthAttributesConcern

  extend FriendlyId
  friendly_id :slug_add, use: :slugged
  
  #before_save :update_slug

  has_many :user_authentications

  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :categories, dependent: :destroy
  has_many :images, through: :categories
  has_many :comments, dependent: :destroy

  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  validates :username, presence:true

  mount_uploader :avatar, ImageUploader

  def self.create_from_omniauth(params)
    self.send(params.provider, params)
  end

  def slug_add
    [
      :username,
      [:username, rand(1..10)],
      [:username, rand(1..100)],
      [:username, rand(1..1000)]
    ]
  end

  def should_generate_new_friendly_id?
    username_changed?
  end

  def follow(user)
    active_friendships.create(followed_id: user.id)
  end

  def unfollow(user)
    active_friendships.find_by(followed_id: user.id).destroy
  end

  def following?(user)
   following.include?(user)
  end

  def find_followers(category_or_image_update)
    users_following = User.find followers.ids if followers.ids.any? #include
    MyMailer.some_changes_in_follow(users_following).deliver_now
    #MyMailer.with(user: u).welcome_email.deliver_now

    #    users_following.each do |recipient|
    #   MyMailer.some_changes_in_follow(recipient).deliver_now
    # end
  end

end
