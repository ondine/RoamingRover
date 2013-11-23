class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|

      t.timestamps
      t.string :dogsize
    end
  end
end
