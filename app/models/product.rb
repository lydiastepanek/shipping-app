class Product < ActiveRecord::Base
  validates :name, :presence => true
  has_many :inventory_items
end
