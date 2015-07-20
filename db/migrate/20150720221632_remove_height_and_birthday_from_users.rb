class RemoveHeightAndBirthdayFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :height, :integer
    remove_column :users, :birthday, :date
  end
end
