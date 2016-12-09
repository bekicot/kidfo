class CreateSits < ActiveRecord::Migration
  def change
    create_table :sits do |t|
      t.integer  :sitter_id
      t.integer  :family_id
      t.boolean  :paid
      t.integer  :rate
      t.integer  :status
      t.text     :sit_details
      t.datetime :sit_start
      t.datetime :sit_end

      t.timestamps null: false
    end
     add_index :sits, :sitter_id
     add_index :sits, :family_id

  end
end
