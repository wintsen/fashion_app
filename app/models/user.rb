class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :images_attributes
  has_secure_password
  #Items and Pairings
  has_many :items, dependent: :destroy
  has_many :pairings, dependent: :destroy
  #images
  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images
  #Follow relationship
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  #Like/Comment on Item and Pairing
  has_many :like_items
  has_many :like_pairings
  has_many :liked_items, through: :like_items, source: :item
  has_many :liked_pairings, through: :like_pairings, source: :pairing
  has_many :comment_items
  has_many :comment_pairings
  # Things and comments go together
  # has_many :commented_items, through: :comment_items, source: :item
  # has_many :commented_pairings, through: :comment_pairings, source: :pairing

  before_save {|user| user.email = email.downcase}
  before_save :create_remember_token

  validates :name, presence:true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true

  #Sunspot search
  searchable do
    # Used for user feed
    integer :followed_user_ids, multiple: true
  end

  def feed_items
    Item.from_users_followed_by(self)
  end

  def feed_pairings
    Pairing.from_users_followed_by(self)
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  private
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
