require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
let(:goal) {FactoryGirl.create(:goal)}
let(:user) {FactoryGirl.create(:user)}

  describe "GET #index" do
    it "returns http success" do
      sign_in(user)
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT #update" do
    it "udpates goal" do
      put :update, id: goal.id
      expect(response).to have_http_status(:redirect)
    end

    it "fails to update" do
      put :update, id: goal.id
      expect(flash[:notice]).to be_present
    end
  end

  describe "GET #new" do
    it "gets new page" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates new goal" do
      sign_in(user)
      post :create
      expect(flash[:notice]).to be_present
    end
  end

  describe "DELETE #destroy" do
    it "destroys goal" do
      delete :destroy, id: goal.id
      expect(response).to have_http_status(:redirect)
    end
  end



end
