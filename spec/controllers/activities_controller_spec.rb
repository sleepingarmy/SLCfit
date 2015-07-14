require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do
let(:activity) {FactoryGirl.create(:activity)}

describe "GET #index" do
  it "returns http success" do
    get :index, goal_id: 1, week_id: 1
    expect(response).to have_http_status(:success)
  end
end

describe "PUT #update" do
  it "udpates activity" do
    put :update, id: activity.id, goal_id: 1, week_id: 1, activity: {type: "running"}
    expect(response).to have_http_status(:redirect)
  end

  it "fails to update" do
    put :update, id: activity.id, goal_id: 1, week_id: activity.week_id, activity: {type: nil}
    expect(response).to have_http_status(:render)
  end
end

describe "GET #destroy" do
  it "returns http redirect" do
    delete :destroy, id: activity.id, goal_id: 1, week_id: activity.week_id
    expect(response).to have_http_status(:redirect)
  end
end

end
