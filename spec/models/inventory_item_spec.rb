require "spec_helper"

describe InventoryItem do
  subject { create :inventory_item, :product => product, :inventoriable => warehouse }
  let(:product) { create(:product, :name => "Example Product") }
  let!(:warehouse) { create(:warehouse) }

  context "validations" do
    it { is_expected.to belong_to :inventoriable }
    it { is_expected.to belong_to :product }
  end
end
