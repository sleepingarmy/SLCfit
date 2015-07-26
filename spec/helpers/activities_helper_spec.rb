require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ActivitiesHelper. For example:
#
# describe ActivitiesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ActivitiesHelper, type: :helper do
  let(:activity) {FactoryGirl.create(:item)}

  describe "#format_action" do
    it "returns correct formatted action" do
      expect(helper.format_action("test")).to eq("test_")
    end
  end

  describe "#format_sti" do
    it "returns correct formatted sti with action and/or activity" do
      expect(helper.format_sti("test", "type", "activity")).to eq("test_type")
    end

    it "returns correct formatted sti without action and activity" do
      expect(helper.format_sti(nil, "type", nil)).to eq("types")
    end
  end

  describe "#sti_activity_path" do
    it "returns correct activity path" do
      expect(helper.sti_activity_path("type", "activity", "test")).to eq("test_type_path")
    end
  end
end
