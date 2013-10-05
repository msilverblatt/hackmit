class AddMembersToHouse < ActiveRecord::Migration
  def change
    add_column :houses, :members, :integer
  end
end
