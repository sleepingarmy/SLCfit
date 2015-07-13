require 'rails_helper'

RSpec.describe ActivitiesController, type: :controller do


describe "GET #index" do
  it "returns http success" do
    get :index, goal_id: 1, week_id: 1
    expect(response).to have_http_status(:success)
  end
end

end
