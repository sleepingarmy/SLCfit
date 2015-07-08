class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.belongs_to :week
      t.string :type
      t.timestamps null: false
    end
  end
end
