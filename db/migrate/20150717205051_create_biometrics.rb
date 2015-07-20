class CreateBiometrics < ActiveRecord::Migration
  def change
    create_table :biometrics do |t|
      t.belongs_to :user
      t.integer :age
      t.integer :height
      t.integer :weight
      t.float :mile_speed
      t.integer :lift_weight
      t.timestamps null: false
    end
  end
end
