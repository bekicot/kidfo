class CreateSittings < ActiveRecord::Migration
  def change
    create_table :sittings do |t|

     t.integer :sitter_id
     t.integer :family_id
     t.boolean :paid
     t.integer :rate
     t.integer :status
     t.text    :sitting_details
     t.date    :sitting_date
     t.string  :start_time
     t.string  :end_time

     t.timestamps null: false
 end

     add_index :sittings, :sitter_id
     add_index :sittings, :family_id

  end
end
