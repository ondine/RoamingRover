class AddUserIdToDogWalker < ActiveRecord::Migration
  def change
  	add_column :dog_walkers, :user_id, :integer
  	add_column :clients, :user_id, :integer
  end
end
