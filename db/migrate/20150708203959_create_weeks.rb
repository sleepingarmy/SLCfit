class CreateWeeks < ActiveRecord::Migration
  def change
    create_table :weeks do |t|
      t.belongs_to :goal
      t.has_many :activities
      t.string :name
      t.string :week_begin
      t.string :week_end
      t.timestamps null: false
    end
  end
end
