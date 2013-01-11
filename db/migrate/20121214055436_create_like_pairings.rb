class CreateLikePairings < ActiveRecord::Migration
  def change
    create_table :like_pairings, :id => false do |t|
      t.references :pairing
      t.references :user

      t.timestamps
    end
    add_index :like_pairings, :pairing_id
    add_index :like_pairings, :user_id
    add_index :like_pairings, [:pairing_id, :user_id], :unique => true
  end
end
