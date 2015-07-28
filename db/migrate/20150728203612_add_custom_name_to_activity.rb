class AddCustomNameToActivity < ActiveRecord::Migration
  def change
    add_column :activities, :name, :string
  end
end
