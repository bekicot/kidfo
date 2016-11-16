class CreateParenthoods < ActiveRecord::Migration
  def change
    create_table :parenthoods do |t|
      t.integer :user_id
      t.integer :family_id
      t.timestamps null: false
    end
    add_index :parenthoods, :user_id
    add_index :parenthoods, :family_id
  end
end
