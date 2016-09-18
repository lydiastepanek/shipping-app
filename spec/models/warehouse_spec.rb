require "spec_helper"

describe Warehouse, "validations" do
  subject { build :warehouse }

  it { is_expected.to have_many :inventory_items }
  it { is_expected.to have_many :shipments }
end

describe Warehouse, ".find_warehouse" do
  let!(:large_warehouse) { create :warehouse }
  let!(:small_warehouse) { create :warehouse }
  let!(:product) { create :product }
  let!(:large_warehouse_items) { 10.times.map { create(:inventory_item, :inventoriable => large_warehouse, :product => product) } }
  let!(:small_warehouse_items) { 5.times.map { create(:inventory_item, :inventoriable => small_warehouse, :product => product) } }

  it "returns nil if no warehouses can fulfill the quantity" do
    product_options = { product.id => 1000 }
    expect(Warehouse.find_warehouse(product_options)).to be_nil
  end

  it "returns one warehouse if one warehouse can fulfill the quantity" do
    product_options = { product.id => 10 }
    expect(Warehouse.find_warehouse(product_options)).to eq(large_warehouse)
  end

  it "returns the first warehouse that can fulfill the quantity if multiple warehouses can" do
    product_options = { product.id => 1 }
    expect(Warehouse.find_warehouse(product_options)).to eq(large_warehouse)
  end
end

describe Warehouse, "#collect_items" do
  subject { build :warehouse }
  let!(:apples) { create(:product, :name => "apples") }
  let!(:oranges) { create(:product, :name => "oranges") }
  let!(:apple_items) { 5.times.map { create(:inventory_item, :inventoriable => subject, :product => apples) } }
  let!(:orange_items) { 5.times.map { create(:inventory_item, :inventoriable => subject, :product => oranges) } }

  it "collects the correct number of items for each product it is given" do
    product_options = { apples.id => 3, oranges.id => 2 }
    inventory_items = subject.collect_items(product_options)

    expect(inventory_items).to eq(apple_items.first(3).concat(orange_items.first(2)))
  end
end
