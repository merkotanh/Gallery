class User < ApplicationRecord
  include OmniauthAttributesConcern

  extend FriendlyId
  friendly_id :slug_add, use: :slugged

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: %i[github google_oauth2 facebook]

  acts_as_voter

  has_many :user_authentications, dependent: :destroy
  has_many :categories, dependent: :destroy
  has_many :images, through: :categories
  has_many :comments, dependent: :destroy

  has_many :active_friendships, class_name: "Friendship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_friendships, class_name: "Friendship", foreign_key: "followed_id", dependent: :destroy

  has_many :following, through: :active_friendships, source: :followed
  has_many :followers, through: :passive_friendships, source: :follower

  validates :username, presence:true
  validates :email, presence:true, uniqueness: true

  mount_uploader :avatar, ImageUploader

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.provider = auth.provider
      user.uid = auth.uid
      user.slug = auth.info.name
      user.username = auth.info.name
      user.save!(validate: false)
    end
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

  def find_followers
    users_following = User.find followers.ids if followers.ids.any?
    begin
      MyMailer.some_changes_in_follow(users_following).deliver_now if users_following != nil
    rescue
    end
  end

end
