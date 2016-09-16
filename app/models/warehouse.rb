class Warehouse < ActiveRecord::Base
  has_many(
    :inventory_items,
    :class_name => "InventoryItem",
    :foreign_key => :warehouse_id,
    :primary_key => :id
  )

  def self.find_warehouse(product_options)
    self.warehouses_with(product_options).first
  end

  def self.warehouses_with(product_options)
    warehouses = []
    self.each do |warehouse|
      can_fulfill = true
      product_options.each do |product, quantity|
        if !warehouse.can_fulfill?(product, quantity)
          can_fulfill = false
        end
      end
      warehouses << warehouse if can_fulfill
    end
    warehouses
  end

  def can_fulfill?(product, quantity)
    quantity < quantity_available_of(product)
  end

  def quantity_available_of(product)
    inventory_items.where(:available => true, :product => product).count
  end
end
