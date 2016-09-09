class AddHealthtoKids < ActiveRecord::Migration
  def change
  	add_column :kids, :health_ins_enrollee_id, :string
  	add_column :kids, :health_ins_group_num, :string
  	add_column :kids, :parent1_phone, :string
  	add_column :kids, :parent2_phone, :string
  end
end
