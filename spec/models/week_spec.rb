require 'rails_helper'

RSpec.describe Week, type: :model do
  let(:week) {FactoryGirl.create(:week)}
  let(:activity) {FactoryGirl.create(:activity)}
  goal1 =FactoryGirl.attributes_for(:goal)
  activity1 = FactoryGirl.attributes_for(:goal)

describe "returns activities of corresponding days" do
  it "returns all activities logged on wed" do
    week
    {activity: activity1}
    expect(week.activities.complete.wed.count).to_not eq(0)
  end
end

end
