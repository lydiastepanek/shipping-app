class ShipmentsController < ApplicationController
  def create
    shipment_creator = ShipmentCreator.initialize(shipment_params[:product_options])
    if shipment_creator.run
      render :json => shipment_creator.shipment, :status => :created
    else
      render :json => { :error => shipment_creator.errors.join(', ') }, :status => :unprocessable_entity
    end
  end

  private

  def shipment_params
    params.require(:shipment).allow(:product_options)
  end
end
