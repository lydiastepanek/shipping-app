require "spec_helper"

describe Shipment do
  subject { build :shipment }

  context "validations" do
    it { is_expected.to have_many :inventory_items }
  end

  describe "#create_shipment" do
    let(:inventory_item_1) { build(:inventory_item, :product => product) }
    let(:inventory_item_2) { build(:inventory_item, :product => product) }
    let(:product) { build(:product) }
    let(:warehouse) { build(:warehouse) }

    it "creates a shipment with the correct warehouse and inventory items" do
      inventory_items = [inventory_item_1, inventory_item_2]
      shipment = Shipment.create_shipment(warehouse, inventory_items)
      shipment.save!
      shipment.reload

      expect(shipment).to be_valid
    end
  end
end
