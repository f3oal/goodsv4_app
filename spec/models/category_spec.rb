require 'spec_helper'

describe Category do
  it 'is valid with a name' do
    category = Category.new(name: 'glass')
  expect(category).to be_valid
  end
  
#name
  it 'is invalid without name' do	
    expect(Category.new(name: '')).to be_invalid
  end
  
  it 'is invalid if name is already taken' do	
    Category.create(
      name: 'Dictionary')
    category = Category.new(
      name: 'Dictionary')
    expect(category).to be_invalid
  end
  
  
end


