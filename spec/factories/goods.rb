FactoryGirl.define do
  factory :good do
  	price '123'
    sequence(:name)   { |n| "User#{n}"}
    category_id 1
  end
end