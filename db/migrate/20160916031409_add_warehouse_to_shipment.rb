class AddWarehouseToShipment < ActiveRecord::Migration
  def change
    add_column :shipments, :warehouse_id, :integer, :null => false
  end
end
