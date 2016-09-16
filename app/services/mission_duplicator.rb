class ShipmentCreator
  attr_reader :params

  def initialize(product_options)
    @product_options = product_options
  end

  def run
    warehouse = Warehouse.find_warehouse(@product_options)
    if warehouse 
      Shipment.create_shipment
    else
      raise "not able to fulfill order at this time"
    end
  end
end
