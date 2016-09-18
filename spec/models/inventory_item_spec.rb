require "spec_helper"

describe InventoryItem do
  subject { build :inventory_item, :product => product, :inventoriable => warehouse }
  let(:product) { build(:product) }
  let(:warehouse) { build(:warehouse) }

  context "validations" do
    it { is_expected.to belong_to :inventoriable }
    it { is_expected.to belong_to :product }
  end
end
