class Shipment < ActiveRecord::Base
  has_many :inventory_items, :as => :inventoriable
  belongs_to :warehouse

  def self.create_shipment(warehouse, inventory_items)
    Shipment.new(
      :warehouse => warehouse,
      :inventory_items => inventory_items
    )
  end
end
