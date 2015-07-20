class CreateInfos < ActiveRecord::Migration
  def change
    create_table :infos do |t|
      t.belongs_to :user
      t.date :birthday
      t.integer :age
      t.integer :height
      t.timestamps null: false
    end
  end
end
