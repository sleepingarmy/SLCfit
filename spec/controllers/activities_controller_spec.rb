require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
let(:activity) {FactoryGirl.create(:activity)}
let(:week) {FactoryGirl.create(:week)}
let(:goal) {FactoryGirl.create(:goal)}
let(:user) {FactoryGirl.create(:user)}

  describe "GET #index" do
    it "returns http success" do
      sign_in(user)
      goal
      week
      get :index, goal_id: goal.id, week_id: week.id
      expect(response).to have_http_status(:success)
    end
  end

  # describe "GET #new" do
  #   it "gets new page" do
  #     sign_in(user)
  #     get :new, goal_id: goal.id, week_id: week.id
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "POST #create" do
    it "creates new activity" do
      sign_in(user)
      activity
      post :create, week_id: week.id, goal_id: goal.id
      expect(response).to have_http_status(:redirect)
    end

    it "fails to create activity" do
      sign_in(user)
      post :create, week_id: week.id, goal_id: goal.id
      binding.pry
      expect(response).to redirect_to(action: 'new')
    end
  end

  describe "GET #destroy" do
    it "returns http redirect" do
      sign_in(user)
      delete :destroy, id: activity.id, goal_id: goal.id, week_id: activity.week_id
      expect(response).to have_http_status(:redirect)
    end
  end

end
