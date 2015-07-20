class BiometricsController < ApplicationController
  before_action :find_user
  before_action :find_biometric
  before_action :find_user

  def index
    @biometrics = Biometric.where(user_id: current_user.id).sort_by_created_at

    @bio_array = [['date', 'weight'], ]

    @biometrics.each do |bio|
      biodate = bio.created_at.strftime "%a %D"
      bioweight = bio.weight
      @bio_array << [biodate, bioweight]
    end

  end

  def show
  end

  def edit
  end

  def new
    @biometric = Biometric.new
  end

  def create
    @biometric = current_user.biometrics.new(bio_params)
    if @biometric.save
      flash[:notice] = "your biometric for today has been saved!"
      redirect_to biometrics_path
    else
      flash[:error] = "oops!  something went wrong."
      redirect_to biometrics_path
    end
  end

  def destroy
    if @biometric.destroy
      flash[:notice] = "Your biometric data has been destroyed."
      redirect_to biometrics_path
    else
      flash[:error] = "We couldn't destroy your data!"
    end
  end

  private

  def bio_params
    params.require(:biometric).permit(:birthday, :age, :height, :weight, :mile_speed, :lift_weight)
  end

  def find_user
    @user = current_user
    unless @user
      redirect_to root_path
    end
  end

  def find_biometric
    @biometric = Biometric.find_by(id: params[:id])
  end
end
