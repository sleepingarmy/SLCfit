class WeeksController < ApplicationController
  before_action :find_user
  before_action :find_week, only: [:show, :update]
  before_action :find_goal
  #before_action :find_activity

  def index
    @weeks = @goal.weeks
  end

  def show
    @activities = @week.activities
  end

  def edit
    @week = Week.find_by(id: params[:id])
  end

  def update
    if @week.update(week_params)
      redirect_to (goal_week_path(@goal.id, @week.id))
    else
      render :new, status: 400
      flash[:error] = "week failed to update due to nil name"
    end
  end

  private

  def find_user
    @user = current_user
  end

  # def find_activity
  #   @activity = @week.activities.find_by(id: params[:id])
  # end

  def find_goal
    @goal = Goal.find_by(id: params[:goal_id])
  end

  def week_params
    params.fetch(:week, {}).permit(:name, :activities)
  end

  def find_week
    @week = Week.find_by(id: params[:id])
    unless @week
      render(text: 'Week not found', status: 404)
    end
  end
end
