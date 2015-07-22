require 'rails_helper'

RSpec.describe Week, type: :model do
  let(:week) {FactoryGirl.create(:week)}
  let(:activity) {FactoryGirl.create(:activity)}

  describe "returns all activities logged on wed" do
  end

end
