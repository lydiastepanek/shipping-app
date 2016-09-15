class InventoryItem < ActiveRecord::Base
  validates :warehouse_id, :product_id, :presence => true
  validates :available, :inclusion => [true, false]

  belongs_to(
    :warehouse,
    :class_name => "Warehouse",
    :foreign_key => :warehouse_id,
    :primary_key => :id
  )

  belongs_to(
    :product,
    :class_name => "Product",
    :foreign_key => :product_id,
    :primary_key => :id
  )

  belongs_to(
    :shipment,
    :class_name => "Shipment",
    :foreign_key => :shipment_id,
    :primary_key => :id
  )

  after_initialize do
    self.available = true if available.nil?
  end
end
