require 'rails_helper'

RSpec.describe InfosController, type: :controller do
let(:info) {FactoryGirl.create(:info)}
let(:user) {FactoryGirl.create(:user)}

  describe "GET #index" do
    it "returns http success" do
      sign_in(user)
      get :index
      expect(response).to have_http_status(:success)
    end

    it "redirects if no user" do
      get :index
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      sign_in(user)
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "successfully creates new info" do
      sign_in(user)
      post :create, info: {height: 60}
      expect(flash[:notice]).to be_present
    end

    it "fails to create info" do
      sign_in(user)
      post :create, info: {height: nil}
      expect(flash[:error]).to be_present
    end
  end

  describe "PUT #update" do
    it "successfully updates info" do
      sign_in(user)
      put :update, id: info.id, info: {height: 60}
      expect(flash[:notice]).to be_present
    end

    it "fails to update info" do
      sign_in(user)
      put :update, id: 12, info: {height: nil}
      expect(flash[:error]).to be_present
    end
  end

end
