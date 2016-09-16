class Shipment < ActiveRecord::Base
  has_many :inventory_items, :as => :inventoriable
  belongs_to :warehouse
end
