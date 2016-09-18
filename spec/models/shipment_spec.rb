require "spec_helper"

describe Shipment do
  subject { build :shipment }

  context "validations" do
    it { is_expected.to have_many :inventory_items }
    it { is_expected.to belong_to :warehouse }
  end
end
