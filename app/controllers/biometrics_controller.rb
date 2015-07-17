class BiometricsController < ApplicationController
  before_action :find_user
  before_action :find_biometric

  def index
    @biometrics = Biometric.all.sort_by_created_at

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
    params.require(:biometric).permit(:age, :height, :weight, :mile_speed, :lift_weight)
  end

  def find_user
    @user = current_user
  end

  def find_biometric
    @biometric = Biometric.find_by(id: params[:id])
  end
end
