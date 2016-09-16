class Warehouse < ActiveRecord::Base
  has_many :inventory_items, :as => :inventoriable
  has_many :shipments

  def self.find_warehouse(product_options)
    self.each do |warehouse|
      can_fulfill_all = true
      product_options.each do |product, quantity|
        if !warehouse.can_fulfill?(product, quantity)
          can_fulfill_all = false
        end
      end
      return warehouse if can_fulfill_all
    end
  end

  def can_fulfill?(product, quantity)
    quantity < inventory_items.where(:product => product).count
  end

  def collect_items(product_options)
    products = []
    product_options.each do |product, quantity|
      products << self.where(:inventoriable => warehouse, :product => product).take(quantity)
    end
    products
  end
end
