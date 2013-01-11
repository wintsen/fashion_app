class Image < ActiveRecord::Base
  attr_accessible :large_url, :medium_url, :original_url, :small_url, :thumb_url
  #Item/Pairing:
    #Large = 600x600(scaled)
    #Medium = 204width(scaled)
    #Small = 150x150(scaled+cropped)
    #Thumb = 50x50(scaled+cropped)
  #User:
    #Large = 600x600(scaled)
    #Medium = 150x150(scaled+cropped)
    #Small = 50x50(scaled+cropped)
    #Thumb = 32x32(scaled+cropped)

  belongs_to :imageable, polymorphic: true
end
