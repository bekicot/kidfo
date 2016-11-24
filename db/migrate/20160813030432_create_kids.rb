class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|
      t.string :name
      t.date :birthdate
      t.string :gender
      t.string :insuranceprovider

      t.string :bedtime
      t.text :sleeproutine

      t.string :allergies

      t.string :physicianname
      t.string :physicianphone

      t.string :parent1
      t.string :parent2

      t.string :chores
      t.string :nonos

      t.integer :family_id

      t.timestamps null: false
    end
    add_index :kids, :family_id
  end
end
