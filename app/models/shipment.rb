class Shipment < ActiveRecord::Base
  has_many(
    :inventory_items,
    :class_name => "InventoryItem",
    :foreign_key => :shipment_id,
    :primary_key => :id
  )

  def self.able_to_ship?(product_options)
    product_options.each do |product, quantity|
      product.check(quantity)
    end
  end

  def self.create_shipment(product_options)
    product_options.map do |product, quantity|
    end
    if warehouse
      Shipment.create!(
        :inventory_item => warehouse.most_available_items
      )
    end
  end
end
