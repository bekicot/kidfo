class AddAvatarToFamily < ActiveRecord::Migration
  def change
  	add_column :families, :avatar, :string
  end
end
