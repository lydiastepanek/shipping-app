class ShipmentCreator
  def run(product_options)
    warehouse = Warehouse.find_warehouse(product_options)
    if warehouse
      Shipment.create_shipment(warehouse, product_options)
    else
      raise "not able to fulfill order at this time"
    end
  end
end
