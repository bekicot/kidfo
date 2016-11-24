class RemoveParentsfromKids < ActiveRecord::Migration
  def change
    remove_column :kids, :parent1
    remove_column :kids, :parent2
    remove_column :kids, :parent1_phone
    remove_column :kids, :parent2_phone
    remove_column :kids, :user_id
  end
end
