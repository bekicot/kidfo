class AddInsuranceToFamilies < ActiveRecord::Migration
  def change
  	add_column :families, :insuranceprovider, :string
  	add_column :families, :health_ins_enrollee_id, :string
  	add_column :families, :health_ins_group_num, :string
  end
end
