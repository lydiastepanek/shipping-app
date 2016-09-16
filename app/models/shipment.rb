class Shipment < ActiveRecord::Base
  has_many :inventory_items, :as => :inventoriable

  def self.create_shipment(warehouse, product_options)
    inventory_items = InventoryItem.collect_items(warehouse, product_options)
    shipment = Shipment.new(
      :warehouse => warehouse,
      :inventory_items => inventory_items
    )
    shipment.transaction do
      inventory_items.each do |item|
        item.update!(:inventoriable => shipment)
      end
      shipment.save!
    end
  end
end
