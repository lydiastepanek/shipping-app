class Shipment < ActiveRecord::Base
  validates :warehouse, :presence => true

  has_many :inventory_items, :as => :inventoriable
  belongs_to :warehouse
end
