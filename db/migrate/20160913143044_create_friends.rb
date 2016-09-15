class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|

      t.integer :kid_id
      t.datetime :created_at
      

      t.timestamps null: false
    end
  end
end
