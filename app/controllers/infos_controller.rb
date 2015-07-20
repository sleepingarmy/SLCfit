class InfosController < ApplicationController
  before_action :find_info, except: [:new]
  before_action :find_user

  def index
    @infos = Info.all
  end

  def show
  end

  def new
    @info = Info.new
  end

  def create
    @info = Info.new(info_params)
    @info.user_id = current_user.id
    if @info.save
      flash[:notice] = "succsex!"
    else
      flash[:error] = "oops!"
    end
    redirect_to goals_path
  end

  def edit
  end

  def update
    if @info.update(info_params)
      binding.pry
      flash[:notice] = "succsex!"
      redirect_to new_biometric_path
    else
      flash[:error] = "oops!"
      redirect_to goals_path
    end
  end

  private
  def find_info 
    @info = Info.find_by(user_id: current_user.id)
  end

  def find_user
    @user = current_user
    unless @user
      redirect_to root_path
    end
  end

  def info_params
    params.require(:info).permit(:birthday, :age, :height)
  end

end
