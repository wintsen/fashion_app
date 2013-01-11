class CommentPairing < ActiveRecord::Base
  belongs_to :pairing
  belongs_to :user
  attr_accessible :comment, :pairing

  validates :pairing_id, presence: true
  validates :user_id, presence: true
  validates :comment, presence: true

  #Retrieval order
  default_scope order: 'comment_pairings.created_at DESC'
end
