require "spec_helper"

describe ShipmentsController do

  describe "POST #create" do
    context "successful POST to #create" do
      it "returns the correct response" do
        post :create, :mission_id => mission.id, :mission => params

        is_expected.to respond_with(:created)
        is_expected.to render_template(:show)
      end
    end

    context "invalid POST to #create" do
      it "returns a :unprocessable_entity status response" do
        params.delete(:title)
        post :create, :mission_id => mission.id, :mission => params

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
