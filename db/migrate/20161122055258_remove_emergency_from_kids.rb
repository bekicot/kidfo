class RemoveEmergencyFromKids < ActiveRecord::Migration
  def change
  	remove_column :kids, :emerg_contact_1
  	remove_column :kids, :emerg_contact_1_phone
  	remove_column :kids, :emerg_contact_2
  	remove_column :kids, :emerg_contact_2_phone
  end
end
