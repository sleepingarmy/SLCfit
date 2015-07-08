class WeeksController < ApplicationController
  before_action :find_user
  before_action :find_activites 
  before_action :find_goal

  def show
    @week = Week.find_by(id: params[:id])
  end

  def edit
    
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

  def find_activities
    @activities = Activity.find_by(id: params[:id])
  end

  def find_goal
    @goal = Goal.find_by(id: params[:id])
  end

  def week_params
    params.require(:week).permit(:activities)
  end
end
