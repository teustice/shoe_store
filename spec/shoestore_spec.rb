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

  describe('#monify') do
    it "should format input to be a decimal in the database" do
      shoe = Shoe.create(brand: "some shoe", price: 50)
      shoe2 = Shoe.create(brand: "some shoe2", price: 50.15)
      expect(shoe.price).to eq 50.0
      expect(shoe2.price).to eq 50.15
    end
  end

  describe('#display_price') do
    it "should format input to be currency for display" do
      shoe = Shoe.create(brand: "some shoe", price: 50)
      shoe2 = Shoe.create(brand: "some shoe2", price: 50.15)
      expect(shoe.display_price).to eq "$50.00"
      expect(shoe2.display_price).to eq "$50.15"
    end
  end
end
