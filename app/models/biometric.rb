class Biometric < ActiveRecord::Base
  belongs_to :user

  def self.sort_by_created_at
    order(:created_at)
  end

  validates_presence_of :height
end
