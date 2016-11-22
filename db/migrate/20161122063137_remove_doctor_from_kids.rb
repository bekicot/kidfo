class RemoveDoctorFromKids < ActiveRecord::Migration
  def change
  	remove_column :kids, :physicianname
  	remove_column :kids, :physicianphone
  end
end
