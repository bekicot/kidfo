class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.string :nature
      t.integer :person_id
      t.datetime :created_at
      t.integer :kid_id

      t.timestamps null: false
    end
  end
end
