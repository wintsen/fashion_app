class Item < ActiveRecord::Base
  attr_accessible :tag_list
  acts_as_taggable_on :tags

  belongs_to :user

  validates :user_id, presence: true

  default_scope order: 'items.created_at DESC'
end
