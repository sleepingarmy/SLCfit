class WeeksController < ApplicationController
  before_action :find_activites 
  before_action :find_goal

  private
  def find_activities
    @activities = Activity.find_by(id: params[:id])
  end

  def find_goal
    @goal = Goal.find_by(id: params[:id])
  end
end
