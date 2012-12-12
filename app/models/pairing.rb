class Pairing < ActiveRecord::Base
  attr_accessible :name, :tag_list, :images_attributes, :item_array
  acts_as_taggable_on :tags

  belongs_to :user

  #has_and_belongs_to_many :items
  has_many :pairing_items, dependent: :destroy
  has_many :items, through: :pairing_items

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :user_id, presence: true
  validates :name, presence: true

  default_scope order: 'pairings.created_at DESC'

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
