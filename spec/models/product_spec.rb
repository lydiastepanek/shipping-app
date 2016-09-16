require "spec_helper"

describe Product do
  subject { create :product }

  context "validations" do
    it do
      is_expected.to have_many :inventory_items
      is_expected.to validate_presence_of :name
    end
  end
end
