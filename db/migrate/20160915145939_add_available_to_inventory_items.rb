class AddAvailableToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :available, :boolean, :null => false
  end
end
