class CreateDogWalkers < ActiveRecord::Migration
  def change
    create_table :dog_walkers do |t|

      t.timestamps
      t.string :breeds
      t.string :experience
      t.string :rate
    end
  end
end
