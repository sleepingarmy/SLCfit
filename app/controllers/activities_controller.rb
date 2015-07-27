class ActivitiesController < ApplicationController
  before_action :set_type
  before_action :set_activity, only: [:show, :edit, :destroy, :complete, :activity_tr]
  before_action :activity_data, only: [:index, :display, :bank, :progress]

  def index
    @goal= Goal.find_by(id: params[:goal_id])
  end

  def show
  end

  def edit
  end

  def update
    activity = Activity.find_by(id: params[:id])
    date = params[:date]
    activity.date = date
    activity.day_of_week = date.to_date.strftime('%a').downcase
    activity.duration= params[:duration]
    activity.description= params[:description]
    activity.complete= true
    activity.save
    render :nothing => true
  end

  def destroy
    @activity.destroy
    redirect_to goal_week_activities_path
  end

  def _new
    @goal= Goal.find_by(id: params[:goal_id])
    @week= Week.find_by(id: params[:week_id])
    @activity = type_class.new
  end

  def create
    @goal= Goal.find_by(id: params[:goal_id])
    @week= Week.find_by(id: params[:week_id])
    @activity = @week.activities.new(activity_params)

    if @activity.save
      redirect_to goal_weeks_path(@goal.id)
    else
      render action: 'new'
    end
  end

  def activity_tr
    render partial: 'activity_tr', locals: {activity: @activity}
  end

  def display
   render partial: "calendar", locals: {week: @week}
  end

  def progress
    render partial: 'progress', locals: {week: @week}
  end

  def bank
    #binding.pry
    render partial: 'bank', locals: {week: @week, index: params[:index]}
  end

  private
    def set_activity
     @activity = type_class.find(params[:id])
    end

    def set_type
      @type = type
    end

    def type
      Activity.types.include?(params[:type]) ? params[:type] : "Activity"
    end

    def type_class
      type.constantize
    end

    def activity_params
      params.fetch(type.underscore.to_sym, {}).permit(:type, :week_id, :day_of_week)
    end

    def activity_data
      @week = Week.find_by(id: params[:week_id])
      @activities_complete = @week.activities.complete
      @activities_not_complete = @week.activities.not_complete
    end
end
