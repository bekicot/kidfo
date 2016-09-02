class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|

    t.string :authors
    t.string :isbn
    t.string :description
    t.string :image_link
    
    t.timestamps null: false
    end
  end
end
