class RemoveInsuranceFromKids < ActiveRecord::Migration
  def change
    remove_column :kids, :insuranceprovider
    remove_column :kids, :health_ins_enrollee_id
    remove_column :kids, :health_ins_group_num
  end
end
