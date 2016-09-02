class AlterUserIdOnBooks < ActiveRecord::Migration
  def change
  	rename_column :books, :user_id, :kid_id
  end
end
