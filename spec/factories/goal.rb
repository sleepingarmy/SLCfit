FactoryGirl.define do
  factory :goal do
    user_id "1"
    description "test goal description"
    reason "test goal reason"
    time_frame 5
    complete true
  end
end
