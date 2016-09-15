class Warehouse < ActiveRecord::Base
  has_many(
    :inventory_items,
    :class_name => "InventoryItem",
    :foreign_key => :warehouse_id,
    :primary_key => :id
  )

  def self.warehouses_with(product, quantity)
    self.map do |warehouse|
      warehouse.id if warehouse.can_fulfill?(product, quantity)
    end
  end

  def can_fulfill?(product, quantity)
    quantity < quantity_available_of(product)
  end

  def quantity_available_of(product)
    inventory_items.where(:available => true, :product => product).count
  end
end
