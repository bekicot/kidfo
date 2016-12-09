class CreateFamilysitters < ActiveRecord::Migration
  def change
    create_table :familysitters do |t|

      t.integer :sitter_id
      t.integer :family_id

      t.timestamps null: false
    end
    
    add_index :familysitters, :sitter_id
    add_index :familysitters, :family_id

  end
end
