class AddAvatarToKids < ActiveRecord::Migration
  def change
    add_column :kids, :avatar, :string
  end
end
