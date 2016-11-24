class AddDoctorToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :physicianname, :string
    add_column :families, :physicianphone, :string
  end
end
