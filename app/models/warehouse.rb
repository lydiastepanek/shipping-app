class Warehouse < ActiveRecord::Base
  has_many :inventory_items, :as => :inventoriable
  has_many :shipments

  def self.find_warehouse(product_options)
    self.warehouses_with(product_options).first
  end

  def self.warehouses_with(product_options)
    warehouses = []
    self.each do |warehouse|
      can_fulfill_all = true
      product_options.each do |product, quantity|
        if !warehouse.can_fulfill?(product, quantity)
          can_fulfill_all = false
        end
      end
      warehouses << warehouse if can_fulfill_all
    end
    warehouses
  end

  def can_fulfill?(product, quantity)
    quantity < inventory_items.where(:product => product).count
  end
end
