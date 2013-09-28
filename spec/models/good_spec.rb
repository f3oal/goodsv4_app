require 'spec_helper'

describe Good do
  it "is valid with a name,price and category_id" do
    good = Good.new(
      name: 'Milk',
      price: '123',
      category_id: 1)
  expect(good).to be_valid
  end


#name
  it "is invalid without a name" do
    expect(Good.new(name: '')).to be_invalid
  end

  it "is invalid when name is nill" do
    expect(Good.new(name: nil)).to be_invalid
  end


#price
  it "is invalid without a price" do
    expect(Good.new(price: '')).to be_invalid
  end

  it "is invalid when price is nil" do
    expect(Good.new(price: nil)).to be_invalid
  end


#category_id
  it "is invalid without a category_id" do
    expect(Good.new(category_id: nil)).to be_invalid
  end
end

