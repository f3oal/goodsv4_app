require 'spec_helper'

describe Good do
  subject { Good.new(name: "Example", price: 123)  }

  it { should respond_to(:name) }
  it { should respond_to(:price) }
  it { should be_valid }

  it 'should not be valid if name is not present' do	
    subject.name = ''
    subject.should_not be_valid
  end
  
  it 'should not be valid if name already taken' do	
    subject.save
    good = Good.new(name: "Example", price: 123)
    good.should_not be_valid 
  end
  
  it 'price should be valid only if greater than 0' do
    subject.price = -2
    subject.should_not be_valid    
  end
   it  { subject.settings.should be_nill }
end
