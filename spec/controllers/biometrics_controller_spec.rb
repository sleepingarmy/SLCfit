require 'rails_helper'

RSpec.describe BiometricsController, type: :controller do
  let(:biometric) { Array.new(3) {FactoryGirl.create(:biometric)}}
  let(:user) {FactoryGirl.create(:user)}
  let(:info) {FactoryGirl.create(:info)}

  describe "GET #index" do
    it "returns http redirect when no biometrics" do
      sign_in(user)
      get :index
      expect(Biometric.count).to eq(0)
      expect(response).to have_http_status(:redirect)
    end

    it "returns http redirect when no biometrics" do
      sign_in(user)
      biometric
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      sign_in(user)
      biometric
      get :show, id: biometric.first.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      sign_in(user)
      biometric
      get :edit, id: biometric.first.id, biometric: {weight: 120}
      expect(response).to have_http_status(:success)
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
    it "creates new biometric" do
      sign_in(user)
      post :create, biometric: {weight: 120}
      expect(flash[:notice]).to be_present
    end

    it "fails to create biometric" do
      sign_in(user)
      post :create, biometric: {weight: nil}
      expect(flash[:error]).to be_present
    end
  end

   describe "DELETE #destroy" do
    it "destroys biometric" do
      sign_in(user)
      biometric
      delete :destroy, id: biometric.first.id
      expect(flash[:notice]).to be_present
    end
  end

end
