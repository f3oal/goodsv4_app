require 'spec_helper'

describe Category do
  subject { Category.new(name: "Example" ) }

  it { should respond_to(:name) }
  it { should be_valid }
  
#name
  it 'should not be valid if name is not present' do	
    subject.name = ''
    subject.should_not be_valid
  end
  
  it 'should not be valid if name already taken' do	
    subject.save
    category = Category.new(name: "Example")
    category.should_not be_valid 
  end
  
  
end


