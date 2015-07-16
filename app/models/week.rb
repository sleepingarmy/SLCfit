class Week < ActiveRecord::Base
  belongs_to :goal, dependent: :destroy
  has_many :activities

  validates_presence_of :name
end
