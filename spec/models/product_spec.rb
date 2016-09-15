require "spec_helper"
require "rails_helper"

describe Product do
  subject { create :product }

  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to have_many :crowd_members }
  end
end
