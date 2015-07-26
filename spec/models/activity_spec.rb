require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:week) {FactoryGirl.create(:week)}
  activity1 = FactoryGirl.attributes_for(:activity, day_of_week: "mon")
  activity2 = FactoryGirl.attributes_for(:activity, day_of_week: "tue")
  activity3 = FactoryGirl.attributes_for(:activity, day_of_week: "wed")
  activity4 = FactoryGirl.attributes_for(:activity, day_of_week: "thu")
  activity5 = FactoryGirl.attributes_for(:activity, day_of_week: "fri")
  activity6 = FactoryGirl.attributes_for(:activity, day_of_week: "sat")
  activity7 = FactoryGirl.attributes_for(:activity, day_of_week: "sun")


  describe "returns correct activities" do
    it "returns all activities logged on mon" do
      week.activities.create(attributes_for(:activity, day_of_week: "mon"))
      {activity: activity1}
      expect(week.activities.complete.mon.count).to_not eq(0)
    end

    it "returns all activities logged on tues" do
      week.activities.create(attributes_for(:activity, day_of_week: "tue"))
      {activity: activity2}
      expect(week.activities.complete.tues.count).to_not eq(0)
    end

    it "returns all activities logged on wed" do
      week.activities.create(attributes_for(:activity, day_of_week: "wed"))
      {activity: activity3}
      expect(week.activities.complete.wed.count).to_not eq(0)
    end

    it "returns all activities logged on thurs" do
      week.activities.create(attributes_for(:activity, day_of_week: "thu"))
      {activity: activity4}
      expect(week.activities.complete.thurs.count).to_not eq(0)
    end

    it "returns all activities logged on fri" do
      week.activities.create(attributes_for(:activity, day_of_week: "fri"))
      {activity: activity5}
      expect(week.activities.complete.fri.count).to_not eq(0)
    end

    it "returns all activities logged on sat" do
      week.activities.create(attributes_for(:activity, day_of_week: "sat"))
      {activity: activity6}
      expect(week.activities.complete.sat.count).to_not eq(0)
    end

    it "returns all activities logged on sun" do
      week.activities.create(attributes_for(:activity, day_of_week: "sun"))
      {activity: activity7}
      expect(week.activities.complete.sun.count).to_not eq(0)
    end
  end

end
