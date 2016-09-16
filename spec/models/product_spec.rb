require "spec_helper"

describe Product do
  subject { create :product }

  context "validations" do
    it do
      is_expected.to have_many :inventory_items
      is_expected.to validate_presence_of :name
    end
  end
end
describe Product do
  let(:product) { create(:product, :name => "brand one") }
  let(:inventory_item) { create(:inventory_item) }
  let(:shipment) { create(:shipment) }
  let(:warehouse) { create(:warehouse) }

  before do
    product.inventory_items << inventory_item
    inventory_item.inventoriable = shipment
    binding.pry
    # product.inventory_items <<
    # inventory_item.shipment = shipment
  end

end
