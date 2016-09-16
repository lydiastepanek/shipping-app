class InventoryItem < ActiveRecord::Base
  belongs_to :inventoriable, :polymorphic => true
  belongs_to :product

  def self.collect_items(warehouse, product_options)
    products = []
    product_options.each do |product, quantity|
      products << self.where(:inventoriable => warehouse, :product => product).take(quantity)
    end
    products
  end
end
