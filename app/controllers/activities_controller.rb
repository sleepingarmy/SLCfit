class ActivitiesController < ApplicationController
  before_action :set_type
  before_action :set_activity, only: [:show, :edit, :update, :destroy]

  def index
    @activities = type_class.all
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
    @activity = type_class.new
  end

  def create
    @activity = Activity.new(activity_params)
    if @activity.save
      redirect_to @activity, notice: "#{type} was successfully created."
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
      params.require(type.underscore.to_sym).permit(:type) 
    end
end
