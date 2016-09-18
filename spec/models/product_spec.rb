require "spec_helper"

describe Product do
  subject { build :product }

  context "validations" do
    it { is_expected.to have_many :inventory_items }
  end
end
