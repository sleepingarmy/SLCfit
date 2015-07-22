class Week < ActiveRecord::Base
  belongs_to :goal, dependent: :destroy
  has_many :activities

 #do we need this?
  # def is_complete?
  #   self.activities_complete.length == self.activities.length
  # end
  
end
