FactoryGirl.define do
  factory :user do
    username "test_username"
    first_name "first name"
    last_name "last name"
    sequence :email do |n| 
      "email#{n}@test.com"
    end
    password "testpassword"
    info
  end
end
