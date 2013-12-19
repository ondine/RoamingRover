class AddZipToActivities < ActiveRecord::Migration
  def change
  	add_column :activities, :zipcode, :integer
  end
end
