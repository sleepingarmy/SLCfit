class GoalsController < ApplicationController
  before_action :find_user
  
  def index
    @goals = Goal.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      flash[:notice] = "Your goal was successfully created!"
      redirect_to(goals_path)
  end

  def destroy
  end


  private

    def goal_params
      params.require(:goal).permit(:user_id, :description, :reason, :time_frame, :complete)
    end

    def find_goal
      @goal = @user.goals.find_by[id: params [:id]]
      unless goal
        render (text: 'goal not found', status: :not_found)
      end
    end

    def find_user
      @user = current_user
    end


end
