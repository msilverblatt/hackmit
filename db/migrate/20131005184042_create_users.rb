class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :balance
      t.string :username
      t.string :email
      t.integer :house_id

      t.timestamps
    end
  end
end
