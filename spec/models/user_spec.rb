require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Example User", email: "user@example.com", password: "12345678", password_confirmation: "12345678")
  end

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }

  it { should be_valid }
 
 

 #password
  it "should not be valid if password is not present" do
    subject.password = subject.password_confirmation = " " 
    subject.should_not be_valid
  end

  it "should not be valid if password doesn't match confirmation" do
    subject.password_confirmation = "mismatch"
    subject.should_not be_valid 
  end

  it "should not be valid if password confirmation is nil" do
    subject.password_confirmation = nil 
    subject.should_not be_valid 
  end

  it "should not be valid if password < 6" do
    subject.password = "ex"
    subject.should_not be_valid
  end

  it "should not be valid if password > 16" do
    subject.password = "a" * 17
    subject.should_not be_valid
  end



#name
  it "should not be valid if name  already taken" do
    subject.save
    user = User.new(name: "Example User", email: "user@example.com", password: 12345678, password_confirmation: 12345678)
    user.should_not be_valid 
  end

  it "should not be valid if name < 5" do
    subject.name = "a" * 2
    subject.should_not be_valid
  end

  it "should not be valid if name > 13" do
    subject.name = "a" * 15
    subject.should_not be_valid
  end



#email
  it "should not be valid if email is not present" do
    subject.email = ''
    subject.should_not be_valid
  end

  it "should not be valid if email is already taken" do
    subject.save
    email = User.new(name: "Example1", email: "user@example.com", password: 12345678, password_confirmation: 12345678)
    email.should_not be_valid
  end

  

end
