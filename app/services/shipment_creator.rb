class ShipmentCreator
  def initialize(options)
    @warehouse = Warehouse.find_warehouse(product_options)
    @inventory_items = warehouse.collect_items(product_options)
    @shipment = Shipment.new(
      :warehouse => warehouse,
      :inventory_items => inventory_items
    )
  end

  def run
    @shipment.transaction do
      @inventory_items.each do |item|
        item.update!(:inventoriable => shipment)
      end
      @shipment.save!
    end
  end
end
