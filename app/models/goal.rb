class Goal < ActiveRecord::Base
  belongs_to :user
  has_many :weeks

  validates_presence_of :time_frame
end
