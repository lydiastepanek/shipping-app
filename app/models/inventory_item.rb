class InventoryItem < ActiveRecord::Base
  validates :inventoriable, :product, :presence => true

  belongs_to :inventoriable, :polymorphic => true
  belongs_to :product
end
