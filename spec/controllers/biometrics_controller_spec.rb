require 'rails_helper'

RSpec.describe BiometricsController, type: :controller do
  let(:biometric) { Array.new(3) {FactoryGirl.create(:biometric)}}
  let(:user) {FactoryGirl.create(:user)}

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
      get :edit, id: biometric.first.id
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

   describe "DELETE #destroy" do
    it "destroys biometric" do
      delete :destroy, id: biometric.first.id
      expect(response).to have_http_status(:redirect)
    end
  end

end
