class Pairing < ActiveRecord::Base
  attr_accessible :name, :tag_list, :images_attributes, :item_array
  acts_as_taggable_on :tags

  belongs_to :user

  #has_and_belongs_to_many :items
  has_many :pairing_items, dependent: :destroy
  has_many :items, through: :pairing_items

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images

  #Like/Comment
  has_many :like_pairings
  has_many :user_likes, through: :like_pairings, source: :user
  has_many :comment_pairings
  # User and comments go together
  # has_many :commenting_users, through: :comment_pairings, source: :user

  #Validation
  validates :user_id, presence: true
  validates :name, presence: true

  #Retrieval order
  default_scope order: 'pairings.created_at DESC'

  #Sunspot search
  searchable do 
    text :tag_list, :name
    time :created_at
    integer :user_id
  end
  
  def item_array
    #TODO when making edit form
  end
  def item_array=(array)
    self.item_ids = array.split(',')
  end

  def self.from_users_followed_by(user)
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
  end
end
