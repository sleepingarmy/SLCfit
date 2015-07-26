class Info < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :height
end
