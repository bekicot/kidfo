class CreateInvites < ActiveRecord::Migration
  def change
   create_table :invites do |t|
      t.string :email
      t.integer :status
      t.string :code
      t.integer :family_id
      t.integer :user_id
      t.integer :invite_kind

      t.timestamps null: false
    end
    add_index :invites, :status
    add_index :invites, :code
    add_index :invites, :family_id
    add_index :invites, :user_id
  end
end
