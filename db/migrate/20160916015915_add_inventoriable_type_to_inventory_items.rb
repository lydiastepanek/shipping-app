class AddInventoriableTypeToInventoryItems < ActiveRecord::Migration
  def change
    add_column :inventory_items, :inventoriable_type, :string, :null => false
  end
end
