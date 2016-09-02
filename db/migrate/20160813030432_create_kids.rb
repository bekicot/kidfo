class CreateKids < ActiveRecord::Migration
  def change
    create_table :kids do |t|

      t.date :birthdate
      t.string :gender
      t.string :insuranceprovider

      t.string :favfood
      t.string :favdrink
      t.string :favbooks
      t.string :favmovies
      t.string :favtoys
      t.string :favactivities
      t.string :favmusic

      t.string :bedtime

      t.string :allergies

      t.string :physicianname
      t.string :physicianphone

      t.string :parent1
      t.string :parent2

      t.string :chores
      t.string :nonos


      t.timestamps null: false
    end
  end
end
