require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.create(:user)}

  describe "def_forem" do
    it "sets correct username" do
      expect(user.forem_name).to eq("test_username")
    end
  end

end
