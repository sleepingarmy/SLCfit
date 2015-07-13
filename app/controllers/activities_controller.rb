class ActivitiesController < ApplicationController
  before_action :set_type
  before_action :set_activity, only: [:show, :edit, :update, :destroy]
  #before_action :find_week

  def index
    @week = Week.find_by(id: params[:week_id])
    @goal= Goal.find_by(id: params[:goal_id])
    @activities = Activity.all.where(:week_id => @week.id)
  end

  def show
  end

  def edit
  end

  def update
    if @activity.update(activity_params)
      redirect_to @activity, notice: "#{type} was successfully updated."
    else
      render action: 'edit'
    end
  end

  def destroy
    @activity.destroy
    redirect_to activities_url
  end

  def new
    @goal= Goal.find_by(id: params[:goal_id])
    @week= Week.find_by(id: params[:week_id])
    @activity = type_class.new
  end

  def create
    @goal= Goal.find_by(id: params[:goal_id])
    @week= Week.find_by(id: params[:week_id])
    @activity = @week.activities.new(activity_params)

    if @activity.save
      redirect_to goal_week_activities_path(@goal.id, @week.id), notice: "#{type} was successfully created."
    else
      render action: 'new'
    end
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
      params.require(type.underscore.to_sym).permit(:type, :week_id)
    end

    def find_week
      @week = Week.find_by(id: params[:id])
      unless @week
        render(text: 'Week not found', status: 404)
      end
    end
end
