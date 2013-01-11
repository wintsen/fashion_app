class CreateCommentItems < ActiveRecord::Migration
  def change
    create_table :comment_items, :id => false do |t|
      t.references :item
      t.references :user
      t.text :comment

      t.timestamps
    end
    add_index :comment_items, :item_id
    add_index :comment_items, :user_id
    # add_index :comment_items, [:item_id, :user_id], :unique => true
  end
end
