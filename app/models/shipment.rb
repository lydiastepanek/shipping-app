class Shipment < ActiveRecord::Base
  has_many :inventory_items, :as => :inventoriable

  def self.create_shipment(product_options)
    Shipment.create!(
      :inventory_item => warehouse.most_available_items
    )
  end
end
