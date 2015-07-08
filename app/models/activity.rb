class Activity < ActiveRecord::Base
  belongs_to :week
  self.inheritance_column = :type

   def self.types
     %w(Running Biking Swimming Hiking)
   end

   def self.runnings
     where(type: 'Running')
   end

   def self.bikings
     where(type: 'Biking')
   end

   def self.swimmings
     where(type: 'Swimming')
   end

   def self.hikings
     where(type: 'Hiking')
   end
end
