require 'rails_helper'

RSpec.describe WeeksController, type: :controller do
let(:goal) {FactoryGirl.create(:goal)}
let(:week) {FactoryGirl.create(:week)}

  describe "GET #index" do
    it "returns http success" do
      get :index, goal_id: goal.id
      expect(response).to have_http_status(:success)
    end
  end
  
  describe "GET #show" do
    it "gets show page" do
      get :show, goal_id: goal.id, id: 1
      expect(response).to have_http_status(:success)
    end
  end

end
