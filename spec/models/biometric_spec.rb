require 'rails_helper'

RSpec.describe Biometric, type: :model do
  let(:biometric) { Array.new(3) {FactoryGirl.create(:biometric)}}

  describe "orders biometrics" do
    it "orders biometrics by created_at" do
      biometric
      expect(Biometric.sort_by_created_at.first.created_at).to eq("2015-01-01 12:12:1")
    end
  end
end
