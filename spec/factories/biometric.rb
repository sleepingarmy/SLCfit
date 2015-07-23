FactoryGirl.define do
  factory :biometric do
    age 25
    sequence :created_at do |n|
      "2015-01-01 12:12:#{n}"
    end
  end
end
