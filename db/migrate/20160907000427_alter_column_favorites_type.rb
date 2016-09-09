class AlterColumnFavoritesType < ActiveRecord::Migration
  def change
    rename_column :favorites, :type, :category
  end
end
