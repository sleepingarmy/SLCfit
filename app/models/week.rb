class Week < ActiveRecord::Base
  belongs_to :goal
  has_many :activities
end
