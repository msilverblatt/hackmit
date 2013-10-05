class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.string :title
      t.text :description
      t.integer :amount
      t.integer :user_id
      t.integer :house_id

      t.timestamps
    end
  end
end
