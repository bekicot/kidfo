class RemoveChoresFromKids < ActiveRecord::Migration
  def change
  	remove_column :kids, :chores
  end
end
