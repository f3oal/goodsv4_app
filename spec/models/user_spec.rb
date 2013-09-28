require 'spec_helper'

describe User do
  it "has a valid factory" do
    expect(create(:user)).to be_valid
  end
#password
  it "is invalid without password" do
    expect(build(:user, password: '', password_confirmation: '')).to be_invalid
  end

  it "is invalid when password and password_confirmation are not equal" do
    expect(build(:user, password: '1234567', password_confirmation: '7654321')).to be_invalid
  end

  it "is invalid when password is nil" do
    expect(build(:user, password: nil, password_confirmation: nil)).to be_invalid
  end

  it "is invalid if password < 6" do
    expect(build(:user, password: 'ex')).to be_invalid
  end

  it "is invalid if password > 16" do
    expect(build(:user, password: 'a' * 17)).to be_invalid
  end



#name
  it "is invalid if name is already taken" do
    create(:user, name: "example")
    user = build(:user, name: "example")
    expect(user).to have(1).errors_on(:name)
  end

  it "is invalid if name < 5" do
    expect(build(:user, name: "a" * 4)).to be_invalid
  end

  it "is invalid if name > 13" do
    expect(build(:user, name: "a" * 14)).to be_invalid
  end



#email
  it "is invalid without email" do
    expect(build(:user, email: '')).to be_invalid
  end

  it "is invalid if email is already taken" do
    create(:user, email: "user@example.com") 
    email = build(:user, email: "user@example.com")
    expect(email).to have(1).errors_on(:email)
  end
end
 
 

 
