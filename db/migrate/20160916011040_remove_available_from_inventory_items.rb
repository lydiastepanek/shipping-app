class RemoveAvailableFromInventoryItems < ActiveRecord::Migration
  def change
    remove_column :inventory_items, :available
  end
end
