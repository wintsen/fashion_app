class CreatePairings < ActiveRecord::Migration
  def change
    create_table :pairings do |t|
      t.string :name
      t.references :user

      t.timestamps
    end
    add_index :pairings, :user_id
  end
end
