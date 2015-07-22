class WeeksController < ApplicationController
  before_action :find_user
  before_action :find_week, only: [:show, :update, :create_plan]
  before_action :find_goal

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
    # else
    #   render :new, status: 400
    #   flash[:error] = "week failed to update due to nil name"
    end
  end

  def plan_of_action
    @weeks = @goal.weeks

    activities = @goal.weeks.first.activities
    @activities = activities.map do |activity|
        activity.type
    end
    @activities.uniq!
  end

  def create_plan
    per_week = params[:week][:per_week].to_i
    @goal.weeks.each do |week|
      per_week.times do
        activity = week.activities.new(type: params[:week][:type])
        activity.save
      end
    end
    redirect_to plan_of_action_path(@goal.id)
  end

  private

  def find_user
    @user = current_user
  end


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

  #do we need this?
  # def activity_params
  #   params.require(type.underscore.to_sym).permit(:type, :week_id)
  # end

end
