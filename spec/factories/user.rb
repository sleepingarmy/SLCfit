FactoryGirl.define do
  factory :user do
    username "test_username"
    first_name "first name"
    last_name "last name"
    email "email@test.com"
    password "testpassword"
    info
  end
end