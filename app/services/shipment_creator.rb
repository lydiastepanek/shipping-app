class ShipmentCreator
  def run(product_options)
    warehouse = Warehouse.find_warehouse(product_options)
    if warehouse
      inventory_items = InventoryItem.collect_items(warehouse, product_options)
      shipment = Shipment.create_shipment(warehouse, inventory_items)
      shipment.transaction do
        inventory_items.each do |item|
          item.update!(:inventoriable => shipment)
        end
        shipment.save!
      end
    else
      raise "not able to fulfill order at this time"
    end
  end
end
