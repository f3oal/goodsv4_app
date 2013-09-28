FactoryGirl.define do
  factory :user do
    password "1234567"
    password_confirmation "1234567"
    sequence(:name)   { |n| "User#{n}"}
    sequence(:email)  { |n| "user#{n}@example.com"}
  end

end