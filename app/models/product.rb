class Product < ActiveRecord::Base
  validates :name, :uniqueness => true, :presence => true

  has_many :inventory_items
end
