class CreatePairingItems < ActiveRecord::Migration
  def change
    create_table :pairing_items, :id => false do |t|
      t.references :pairing
      t.references :item

      t.timestamps
    end

    add_index :pairing_items, :pairing_id
    add_index :pairing_items, :item_id
    add_index :pairing_items, [:pairing_id, :item_id], :unique => true
  end
end
