class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :to_id
      t.integer :from_id
      t.integer :amount
      t.integer :house_id

      t.timestamps
    end
  end
end
