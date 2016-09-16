class AddInventoriableToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :inventoriable_id, :integer, :null => false
  end
end
