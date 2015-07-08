class WeeksController < ApplicationController
  before_action :find_user
  before_action :find_activites 
  before_action :find_goal

  def show
    @week = Week.find_by(id: params[:id])
  end

  private

  def find_user
    @user = current_user
  end

  def find_activities
    @activities = Activity.find_by(id: params[:id])
  end

  def find_goal
    @goal = Goal.find_by(id: params[:id])
  end
end
