class CreateSitrequests < ActiveRecord::Migration
  def change
    create_table :sitrequests do |t|
      t.string :email
      t.integer :status
      t.string :code
      t.integer :sit_id
      t.integer :user_id
      t.integer :invite_kind

      t.timestamps null: false
    end
    add_index :sitrequests, :status
    add_index :sitrequests, :code
    add_index :sitrequests, :sit_id
    add_index :sitrequests, :user_id
  end
end
