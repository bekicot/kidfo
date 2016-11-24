class AddEmergencyToFamilies < ActiveRecord::Migration
  def change
    add_column :families, :emerg_contact_1, :string
    add_column :families, :emerg_contact_1_phone, :string
    add_column :families, :emerg_contact_2, :string
    add_column :families, :emerg_contact_2_phone, :string
  end
end
