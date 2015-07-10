class WeeksController < ApplicationController
  before_action :find_user
  before_action :find_week
  before_action :find_goal
  before_action :find_activity

  def index
    week_array = [1..@goal.time_frame].to_a
    week_array.each do |number|
      x = @goal.weeks.new
      x.save
    end
    @weeks = @goal.weeks
    binding.pry
  end

  def show
    @activities = @week.activities
  end

  def edit
    @week = Week.find_by(id: params[:id])
  end

  def update
    if @week.update(week_params)
      redirect_to (week_path(@week.id))
    else
      render :new, status: 400
    end
  end

  private

  def find_user
    @user = current_user
  end

  def find_week
    @week = @goal.week.find_by(id: params[:id])
  end

  def find_activity
    @activity = @week.activities.find_by(id: params[:id])
  end

  def find_goal
    @goal = Goal.find_by(id: params[:id])
  end

  def week_params
    params.require(:week).permit(:activities)
  end

  def find_week
    @week = Week.find_by(id: params[:id])
    unless @week
      render(text: 'Week not found', status: 404)
    end
  end
end
