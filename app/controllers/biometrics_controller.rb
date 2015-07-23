class BiometricsController < ApplicationController
  before_action :find_user
  before_action :find_biometric, except: [:index]
  before_action :find_user
  before_action :find_info

  def index
    @biometrics = Biometric.where(user_id: current_user.id).sort_by_created_at

    unless Biometric.count > 0
      redirect_to infos_path
    end

     # Biometric.create_arrays(@biometrics, current_user)

    # charts = %w[weight bmi speed strength]

    # charts.map do |chart|
    #   @biometrics.each do |bio|
    #   binding.pry
    #     chart_array = [['date', 'chart'], ]
    #     biodate = bio.created_at.strftime "%a %D"
    #     biochart = bio.weight

    #     chart_array << [biodate, biochart]
    #   end
    # end

    # @weight_array = =[['date', 'weight'], ]
    # biodate=bio.created_at.strftime "%a %D"
    # bioweight = bio.weight

    # @weight_array << [biodate, bioweight]


    @weight_array = [['date', 'weight'], ]

    @biometrics.each do |bio|
      biodate = bio.created_at.strftime "%a %D"
      bioweight = bio.weight
      @weight_array << [biodate, bioweight]
    end

    @bmi_array = [['date', 'bmi'], ]

    @biometrics.each do |bio|
      biodate = bio.created_at.strftime "%a %D"
      biobmi = bio.weight * 703 / current_user.info.height ** 2
      @bmi_array << [biodate, biobmi]
    end

    # @speed_array = [['date', 'speed'], ]

    # @biometrics.each do |bio|
    #   biodate = bio.created_at.strftime "%a %D"
    #   speed = bio.mile_speed
    #   @speed_array << [biodate, speed]
    # end

    # @strength_array = [['date', 'strength'], ]

    # @biometrics.each do |bio|
    #   biodate = bio.created_at.strftime "%a %D"
    #   speed = bio.mile_speed
    #   @speed_array << [biodate, speed]
    # end
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

