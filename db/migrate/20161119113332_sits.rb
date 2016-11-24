class Sits < ActiveRecord::Migration
  def change
    create_table :sits do |t|
      t.integer :sitter_id
      t.integer :family_id

      t.timestamps null: false
    end
    add_index :sits, :sitter_id
    add_index :sits, :family_id
  end
end
