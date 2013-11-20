class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :phone
      t.string :user_type
      t.string :password
      t.string :address
      t.string :profile_pic

      t.timestamps
    end
  end
end
