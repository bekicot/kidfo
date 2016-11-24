class ChangeChoresNonosinKids < ActiveRecord::Migration
  def change
    change_column :kids, :nonos, :text
    change_column :kids, :chores, :text
  end
end
