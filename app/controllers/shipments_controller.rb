class ShipmentsController < ApplicationController
  def create
    shipment_creator = ShipmentCreator.new(shipment_params[:product_options])
    shipment = shipment_creator.save
    if shipment
      head :created
    else
      head :unprocessable_entity
    end
  end

  private

  def shipment_params
    params.require(:shipment).permit(:product_options)
  end
end
