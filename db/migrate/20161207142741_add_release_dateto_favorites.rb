class AddReleaseDatetoFavorites < ActiveRecord::Migration
  def change
  	add_column :favorites, :releasedate, :string
  end
end
