class LikePairing < ActiveRecord::Base
  belongs_to :pairing
  belongs_to :user

  validates :pairing_id, presence: true
  validates :user_id, presence: true
end
