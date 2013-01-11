class CreateCommentPairings < ActiveRecord::Migration
  def change
    create_table :comment_pairings, :id => false do |t|
      t.references :pairing
      t.references :user
      t.text :comment

      t.timestamps
    end
    add_index :comment_pairings, :pairing_id
    add_index :comment_pairings, :user_id
    # add_index :comment_pairings, [:pairing_id, :user_id], :unique => true
  end
end
