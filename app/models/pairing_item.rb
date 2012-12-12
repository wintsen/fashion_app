class PairingItem < ActiveRecord::Base
  belongs_to :pairing
  belongs_to :item

  validates :pairing_id, presence: true
  validates :item_id, presence: true
  #TODO validate pairing and item belong to same user
end
