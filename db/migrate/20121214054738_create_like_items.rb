class CreateLikeItems < ActiveRecord::Migration
  def change
    create_table :like_items, :id => false do |t|
      t.references :item
      t.references :user

      t.timestamps
    end
    add_index :like_items, :item_id
    add_index :like_items, :user_id
    add_index :like_items, [:item_id, :user_id], :unique => true
  end
end
