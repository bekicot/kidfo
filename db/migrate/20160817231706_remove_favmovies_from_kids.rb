class RemoveFavmoviesFromKids < ActiveRecord::Migration
  def change
  	remove_column :kids, :favmovies
  end
end
