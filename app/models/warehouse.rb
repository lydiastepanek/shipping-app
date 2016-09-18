class Warehouse < ActiveRecord::Base
  has_many :inventory_items, :as => :inventoriable
  has_many :shipments

  def self.find_warehouse(product_options)
    find do |warehouse|
      product_options.all? do |product_id, quantity|
        quantity <= warehouse.inventory_items.where(:product_id => product_id).count
      end
    end
  end

  def collect_items(product_options)
    product_options.map do |product_id, quantity|
      inventory_items.where(:product_id => product_id).take(quantity)
    end.flatten
  end
end
