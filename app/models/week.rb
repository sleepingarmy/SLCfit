class Week < ActiveRecord::Base
  belongs_to :goal, dependent: :destroy
  has_many :activities
end
