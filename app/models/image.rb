class Image < ActiveRecord::Base
  attr_accessible :large_url, :medium_url, :original_url, :small_url, :thumb_url

  belongs_to :imageable, polymorphic: true
end
