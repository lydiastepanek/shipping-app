class InventoryItem < ActiveRecord::Base
  belongs_to :inventoriable, :polymorphic => true
  belongs_to :product
end
