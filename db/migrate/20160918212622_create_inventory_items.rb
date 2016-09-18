class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :product_id, null: false
      t.integer :inventoriable_id, null: false
      t.string :inventoriable_type, null: false

      t.timestamps
    end
  end
end
