class Item < ActiveRecord::Base
  attr_accessible :tag_list, :name, :images_attributes
  acts_as_taggable_on :tags

  belongs_to :user

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images

  validates :user_id, presence: true
  validates :name, presence: true

  default_scope order: 'items.created_at DESC'
end
