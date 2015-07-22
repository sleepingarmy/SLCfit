require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:week) {FactoryGirl.create(:week)}
  let(:activity) {FactoryGirl.create(:activity)}
  activity1 = FactoryGirl.attributes_for(:activity)

  describe "sets correct type" do
      it "has day of wed" do
      week
      activity
      expect(activity.day_of_week).to eq("wed")
    end
  end

  describe "returns activities of corresponding days" do
    it "returns all activities logged on wed" do
      week.activities.create(attributes_for(:activity))
      {activity: activity1}
      expect(week.activities.complete.wed.count).to_not eq(0)
    end
  end

end
