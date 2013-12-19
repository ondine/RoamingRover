class ChangeDatatypeOfZipcodeInUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :zipcode
  	add_column :users, :zipcode, :integer
  end
end
