require "spec_helper"

describe ShipmentCreator do
  let!(:apples) { create(:product, :name => "apples") }
  let!(:oranges) { create(:product, :name => "oranges") }
  let!(:apple_1) { create(:inventory_item, :product => apples, :inventoriable => warehouse) }
  let!(:apple_2) { create(:inventory_item, :product => apples, :inventoriable => warehouse) }
  let!(:orange_1) { create(:inventory_item, :product => oranges, :inventoriable => warehouse) }
  let!(:warehouse) { create(:warehouse) }

  describe "#save" do
    context "a fillable shipment creation" do
      before do
        product_options = { apples.id => 2, oranges.id => 1 }
        shipment_creator = ShipmentCreator.new(product_options)
        @shipment = shipment_creator.save
      end

      it "returns a shipment assigned to the correct warehouse" do
        expect(@shipment.warehouse_id).to eq(warehouse.id)
      end

      it "assigns all the inventory items to the shipment" do
        [apple_1, apple_2, orange_1].each(&:reload)

        expect(apple_1.inventoriable).to eq(@shipment)
        expect(apple_2.inventoriable).to eq(@shipment)
        expect(orange_1.inventoriable).to eq(@shipment)
      end
    end

    context "an unfillable shipment creation" do
      before do
        product_options = { apples.id => 2000, oranges.id => 1000 }
        @shipment_creator = ShipmentCreator.new(product_options)
      end

      it "returns false" do
        expect(@shipment_creator.save).to be(false)
      end

      it "does not create a shipment" do
        expect(Shipment.count).to be(0)
      end

      it "does not update the inventory items" do
        [apple_1, apple_2, orange_1].each(&:reload)

        expect(apple_1.inventoriable).to eq(warehouse)
        expect(apple_2.inventoriable).to eq(warehouse)
        expect(orange_1.inventoriable).to eq(warehouse)
      end
    end

    context "when the transaction raises an error" do
      before do
        allow(Shipment).to receive(:create).and_raise("example_error")
        product_options = { apples.id => 2, oranges.id => 1 }
        @shipment_creator = ShipmentCreator.new(product_options)
      end

      it "returns false" do
        expect(@shipment_creator.save).to be(false)
      end

      it "does not create a shipment" do
        expect(Shipment.count).to be(0)
      end

      it "does not update the inventory items" do
        [apple_1, apple_2, orange_1].each(&:reload)

        expect(apple_1.inventoriable).to eq(warehouse)
        expect(apple_2.inventoriable).to eq(warehouse)
        expect(orange_1.inventoriable).to eq(warehouse)
      end
    end
  end
end
