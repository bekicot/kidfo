class RemoveFavbooksFromKids < ActiveRecord::Migration
  def change
  	remove_column :kids, :favbooks
  end
end
