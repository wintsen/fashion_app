class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :original_url
      t.string :large_url
      t.string :medium_url
      t.string :small_url
      t.string :thumb_url
      t.belongs_to :imageable, polymorphic: true

      t.timestamps
    end
    add_index :images, [:imageable_id, :imageable_type]
  end
end
