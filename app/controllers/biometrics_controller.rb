class BiometricsController < ApplicationController
  before_action :find_user
  before_action :find_biometric, except: [:index]
  before_action :find_user
  before_action :find_info

  def index
    @biometrics = Biometric.where(user_id: current_user.id).sort_by_created_at

    unless @biometrics.count > 0
      redirect_to infos_path
    end

    @bio_array = [['date', 'weight', 'bmi'], ]

    @biometrics.each do |bio|
      biodate = bio.created_at.strftime "%a %D"
      bioweight = bio.weight
      biobmi = bio.weight * 703 / current_user.info.height ** 2
      @bio_array << [biodate, bioweight, biobmi]
    end

    string_year = current_user.info.birthday.strftime "%Y" 
    @year = string_year.to_i


  end

  def show
  end

  def edit
  end

  def new
    @biometric = Biometric.new

    string_year = current_user.info.birthday.strftime "%Y" 
    @year = string_year.to_i
  end

  def create
    @biometric = current_user.biometrics.new(bio_params)
    if @biometric.save
      flash[:notice] = "your biometric for today has been saved!"
    else
      flash[:error] = "oops! you missed some data.  please try again."
    end
    redirect_to biometrics_path
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

  def find_info 
    @info = Info.find_by(user_id: current_user.id)
  end
end

