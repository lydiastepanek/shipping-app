require "spec_helper"

describe InventoryItem do
  let(:product) { build(:product, :name => "brand one") }
  let(:inventory_item) { build(:inventory_item) }
  let(:shipment) { build(:shipment) }
  let(:warehouse) { build(:warehouse) }

  before do
    # product.inventory_items <<
    # inventory_item.shipment = shipment
  end

  it "test" do
    binding.pry
    product.inventory_items << inventory_item
    inventory_item.inventoriable = shipment

  end

end
