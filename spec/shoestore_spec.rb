require "spec_helper"

describe Store do
  it { should have_and_belong_to_many(:shoes) }
  describe("#capitalize") do
    it "should capitalize the name of a store" do
      store = Store.create(name: "nike employee store")
      expect(store.name).to eq "Nike Employee Store"
    end
  end
end

describe Shoe do
  it { should have_and_belong_to_many(:stores) }
  describe("#capitalize") do
    it "should capitalize the brand of a shoe" do
      shoe = Shoe.create(brand: "some shoe", price: 100)
      expect(shoe.brand).to eq "Some Shoe"
    end
  end
end
