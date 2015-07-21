class AddDayOfWeekToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :day_of_week, :string
  end
end
