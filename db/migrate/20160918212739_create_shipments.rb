class CreateShipments < ActiveRecord::Migration
  def change
    create_table :shipments do |t|
      t.integer :warehouse_id, null: false

      t.timestamps
    end
  end
end
