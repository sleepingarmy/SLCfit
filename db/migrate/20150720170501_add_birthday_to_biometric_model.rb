class AddBirthdayToBiometricModel < ActiveRecord::Migration
  def change
    add_column :biometrics, :birthday, :date
  end
end
