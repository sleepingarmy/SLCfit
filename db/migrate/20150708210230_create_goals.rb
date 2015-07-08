class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.belongs_to :user
      t.text :description
      t.text :reason
      t.integer :time_frame
      t.boolean :complete
      t.timestamps null: false
    end
  end
end
