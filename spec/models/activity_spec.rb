require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:week) {FactoryGirl.create(:week)}
  let(:activity) {FactoryGirl.create(:activity)}

  describe "sets correct type" do
      it "has day of wed" do
      week
      activity
      expect(activity.day_of_week).to eq("wed")
    end
  end

end
