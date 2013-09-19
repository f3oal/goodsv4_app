require 'spec_helper'

describe CartItem do

  before do
    @cartitem = CartItem.new(cart_id: 1, good_id: 1)
  end

  subject { @cartitem }



#good_id
  it "should not be valid if good_id already taken" do
    subject.save
    goodid = CartItem.new(good_id: 1)
    goodid.should_not be_valid
  end
end
