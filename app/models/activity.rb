class Activity < ActiveRecord::Base
  belongs_to :week, dependent: :destroy
  self.inheritance_column = :type

  def icon

  end

   def self.types
     %w(Running Biking Swimming Hiking Soccer)
   end

   def self.mon
     where(day_of_week: 'mon' )
   end

   def self.tues
     where(day_of_week: 'tue')
   end

   def self.wed
     where(day_of_week: 'wed')
     #returns all activities that are logged on wed
   end

   def self.thurs
     where(day_of_week: 'thu' )
   end

   def self.fri
     where(day_of_week: 'fri' )
   end

   def self.sat
     where(day_of_week: 'sat' )
   end

   def self.sun
     where(day_of_week: 'sun' )
   end

   def self.complete
     where(complete: true)
   end

   def self.not_complete
     where.not(complete: true)
   end

end
