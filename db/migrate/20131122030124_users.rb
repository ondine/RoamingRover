class Users < ActiveRecord::Migration
  def change
  	add_column :first_name
  	add_column :last_name
  	remove_column :name
  end
end
