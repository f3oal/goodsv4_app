require 'spec_helper'

describe Good do

  before do
    @good = Good.new(name: "example", price: 123, category_id: 1)
  end
  subject {@good}

  it { should respond_to(:name)        }
  it { should respond_to(:price)       }
  it { should respond_to(:category_id) }
  it { should be_valid }



#name
  it 'should not be valid if name is not present' do	
    subject.name = ''
    subject.should_not be_valid
  end
  
  it 'should not be valid if name already taken' do	
    subject.save
    good = Good.new(name: "example", price: 123)
    good.should_not be_valid 
  end



#price
  it 'price should be valid only if greater than 0' do
    subject.price = -2
    subject.should_not be_valid    
  end



#category
  it { should belong_to(:category)}

  
end
