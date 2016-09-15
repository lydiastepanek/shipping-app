class Product < ActiveRecord::Base
  validates :name, :uniqueness => true, :presence => true

  has_many(
    :inventory_items,
    :class_name => "InventoryItem",
    :foreign_key => :product_id,
    :primary_key => :id
  )

  def warehouses_with_quantity(quantity)
    Warehouse.warehouses_with(self, quantity)
  end

  def check(quantity)
    if warehouses_with_quantity(quantity).empty?
      raise "product #{product.name} is not in stock in needed quantity"
    end
  end
end
