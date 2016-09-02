class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|

      t.string :title
      t.string :cast_characters
      t.string :company
      t.string :trailer_url
      t.string :poster
      t.string :mpaa_rating
      t.integer :kid_id
    

      t.timestamps null: false
    end
  end
end
