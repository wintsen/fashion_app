class CommentItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  attr_accessible :comment, :item

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true

  #Retrieval order
  default_scope order: 'comment_items.created_at DESC'
end
