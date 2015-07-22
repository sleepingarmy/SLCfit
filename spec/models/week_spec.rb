require 'rails_helper'

RSpec.describe Week, type: :model do
  
  it "determines true or false" do
    activity1 =FactoryGirl.attributes_for(:activity)
    activity2 =FactoryGirl.attributes_for(:activity)
    expect(Week.is_complete?).to eq(true)
  end
end
