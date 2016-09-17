class ShipmentCreator
  attr_reader :warehouse
  attr_reader :product_options

  def initialize(product_options)
    @product_options = product_options
    @warehouse = Warehouse.find_warehouse(product_options)
  end

  def fulfillable?
    warehouse.presence
  end

  def save
    return false if !fulfillable?
    inventory_items = warehouse.collect_items(product_options)
    ActiveRecord::Base.transaction do
      shipment = Shipment.create!(:warehouse => warehouse)
      inventory_items.each do |item|
        item.update_attributes!(:inventoriable => shipment)
      end
      shipment
    end
  end
end
