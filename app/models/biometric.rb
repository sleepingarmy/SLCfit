class Biometric < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :weight

  def self.sort_by_created_at
    order(:created_at)
  end

  # def self.create_arrays(biometrics, current_user)
  #   @bio_array = [['date', 'weight'], ]

  #   biometrics.each do |bio|
  #     biodate = bio.created_at.strftime "%a %D"
  #     bioweight = bio.weight
  #     @bio_array << [biodate, bioweight]
  #   end

  #   @bmi_array = [['date', 'bmi'], ]

  #   biometrics.each do |bio|
  #     biodate = bio.created_at.strftime "%a %D"
  #     biobmi = bio.weight * 703 / current_user.info.height ** 2
  #     @bmi_array << [biodate, biobmi]
  #   end

    # @speed_array = [['date', 'speed'], ]

    # biometrics.each do |bio|
    #   biodate = bio.created_at.strftime "%a %D"
    #   speed = bio.mile_speed
    #   @speed_array << [biodate, speed]
    # end

    # @strength_array = [['date', 'strength'], ]

    # biometrics.each do |bio|
    #   biodate = bio.created_at.strftime "%a %D"
    #   speed = bio.mile_speed
    #   @speed_array << [biodate, speed]
    # end
  # end

end
