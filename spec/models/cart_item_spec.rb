require 'spec_helper'

describe CartItem do
  it 'is valid with cart_id and good_id' do
    expect(CartItem.new(cart_id: 1, good_id: 1)).to be_valid
  end



#good_id
  it "is invalid if good_id is already taken" do
    CartItem.create(
      cart_id: 1,
      good_id: 1)
    goodid = CartItem.new(
      good_id: 1)
    expect(goodid).to be_invalid
  end
end
