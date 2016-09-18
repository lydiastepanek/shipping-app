require "spec_helper"

describe ShipmentsController, "POST #create" do
  let(:warehouse) { create(:warehouse) }
  let(:shipment) { create(:shipment, :warehouse => warehouse) }
  let(:shipment_creator) { double("shipment_creator") }

  before do
    allow(ShipmentCreator).to receive(:new).with("product_options").and_return(shipment_creator)
  end

  it "returns the correct response" do
    allow(shipment_creator).to receive(:save).and_return(shipment)
    post :create, :shipment => { :product_options => "product_options" }

    is_expected.to respond_with(:created)
  end

  it "returns a :unprocessable_entity status response" do
    allow(shipment_creator).to receive(:save).and_return(false)
    post :create, :shipment => { :product_options => "product_options" }

    expect(response).to have_http_status(:unprocessable_entity)
  end
end
