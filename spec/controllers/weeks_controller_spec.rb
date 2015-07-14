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
      get :show, goal_id: goal.id, id: week.id
      expect(response).to have_http_status(:success)
    end

    it "fails to show goal" do
      get :show, goal_id: goal.id, id: 1245
      expect(response).to have_http_status(404)
    end
  end

  describe "GET #edit" do
    it "gets edit page" do
      get :edit, goal_id: goal.id, id: week.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "udpates week" do
      put :update, goal_id: goal.id, id: week.id 
      expect(response).to have_http_status(:redirect)
    end

    it "fails to update" do
      put :update, goal_id: goal.id, id: week.id, week: {name: nil}
      expect(flash[:error]).to be_present
    end
  end




end
