class RemoveMembersFromHouse < ActiveRecord::Migration
  def change
    remove_column :houses, :members, :integer
  end
end
