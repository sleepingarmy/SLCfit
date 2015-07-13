class Activity < ActiveRecord::Base
  belongs_to :week, dependent: :destroy
  self.inheritance_column = :type

   def self.types
     %w(Running Biking Swimming Hiking)
   end

   def self.running
     where(type: 'Running')
   end

   def self.biking
     where(type: 'Biking')
   end

   def self.swimming
     where(type: 'Swimming')
   end

   def self.hiking
     where(type: 'Hiking')
   end
end
