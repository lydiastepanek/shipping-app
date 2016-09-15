class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :product_id, :null => false
      t.integer :shipment_id
      t.integer :warehouse_id, :null => false

      t.timestamps
    end
  end
end
