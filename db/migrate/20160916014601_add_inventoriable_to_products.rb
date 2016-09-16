class AddInventoriableToProducts < ActiveRecord::Migration
  def change
    remove_column :inventory_items, :shipment_id
    remove_column :inventory_items, :warehouse_id
  end
end
