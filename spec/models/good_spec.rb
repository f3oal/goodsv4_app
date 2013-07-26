require 'spec_helper'

describe Good do

  before do
  	 @good = Good.new(name: "Example", price: "123") 
  end

  subject { @good }

  it { should respond_to(:name) }
  it { should respond_to(:price) }

  it { should be_valid }

  describe "when name is not present" do
  	before do
  	 @good = Good.new(name: " ", price: " ") 
  	end
   
    it { should_not be_valid }
	end

	describe "when name is already taken" do
		before do
			record_with_same_name = @good.dup
			record_with_same_name.save
		end

		it { should_not be_valid }
	end

	describe "when price < 0" do
		before do
			@good =Good.new(name: "Example", price: "-1")
		end

		it { should_not be_valid}
	end
end