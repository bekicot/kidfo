class AddGuardianToFamily < ActiveRecord::Migration
  def change
  	add_column :families, :kid_id, :integer
  end
end
