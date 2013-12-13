class ChangeDateActivities < ActiveRecord::Migration
  def change
  	remove_column :activities, :date
  	add_column :activities, :date, :string
  end
end
